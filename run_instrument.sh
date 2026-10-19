#!/bin/sh
# Instrument a C program with ext-analysis assertions, compile, and run it.
#
# Usage:
#   ./run_instrument.sh input.c
#
# Intermediate files, including the instrumented MLIR, are retained in /tmp.
# Set LLVM_BIN, CLANG, LLVM_OPT, LLVM_LLC, MLIR_TRANSLATE, MLIR_OPT, PLUGIN,
# or BUILD_DIR to override the defaults.
set -eu

if [ "$#" -ne 1 ]; then
  echo "usage: $0 input.c" >&2
  exit 2
fi

input=$1
if [ ! -f "$input" ]; then
  echo "input file not found: $input" >&2
  exit 1
fi

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
build_dir=${BUILD_DIR:-"$script_dir/build"}
llvm_bin=${LLVM_BIN:-}

find_tool() {
  tool=$1
  override=$2
  if [ -n "$override" ]; then
    if [ ! -x "$override" ]; then
      echo "tool is not executable: $override" >&2
      exit 1
    fi
    printf '%s\n' "$override"
  elif [ -n "$llvm_bin" ] && [ -x "$llvm_bin/$tool" ]; then
    printf '%s\n' "$llvm_bin/$tool"
  elif command -v "$tool" >/dev/null 2>&1; then
    command -v "$tool"
  else
    echo "could not find $tool; set its environment variable or LLVM_BIN" >&2
    exit 1
  fi
}

clang=$(find_tool clang "${CLANG:-}")
llvm_opt=$(find_tool opt "${LLVM_OPT:-}")
llvm_llc=$(find_tool llc "${LLVM_LLC:-}")
mlir_translate=$(find_tool mlir-translate "${MLIR_TRANSLATE:-}")
mlir_opt=$(find_tool mlir-opt "${MLIR_OPT:-}")

if [ -z "${PLUGIN:-}" ]; then
  for candidate in "$build_dir/ZeroAnalysis.so" "$build_dir/ZeroAnalysis.dylib"; do
    if [ -f "$candidate" ]; then
      PLUGIN=$candidate
      break
    fi
  done
fi
if [ -z "${PLUGIN:-}" ] || [ ! -f "$PLUGIN" ]; then
  echo "analysis plugin not found; build it or set PLUGIN" >&2
  exit 1
fi

tmp_dir=$(mktemp -d /tmp/mlir-instrument.XXXXXX)
echo "Keeping instrumentation artifacts in $tmp_dir"

"$clang" -g -S -emit-llvm -O0 -Xclang -disable-O0-optnone \
  "$input" -o "$tmp_dir/input.ll" > /dev/null 2>&1
"$llvm_opt" -S -passes=mem2reg \
  "$tmp_dir/input.ll" -o "$tmp_dir/input.promoted.ll" > /dev/null 2>&1
"$mlir_translate" --import-llvm \
  "$tmp_dir/input.promoted.ll" -o "$tmp_dir/input.mlir" > /dev/null 2>&1

"$mlir_opt" --load-pass-plugin="$PLUGIN" \
  --pass-pipeline='builtin.module(ext-analysis)' \
  "$tmp_dir/input.mlir" -o "$tmp_dir/instrumented.mlir" > /dev/null 2>&1
"$mlir_opt" --pass-pipeline='builtin.module(convert-cf-to-llvm)' \
  "$tmp_dir/instrumented.mlir" -o "$tmp_dir/lowered.mlir" > /dev/null 2>&1
"$mlir_translate" --mlir-to-llvmir \
  "$tmp_dir/lowered.mlir" -o "$tmp_dir/instrumented.ll" > /dev/null 2>&1
"$llvm_llc" -filetype=obj "$tmp_dir/instrumented.ll" \
  -o "$tmp_dir/instrumented.o"
"$clang" "$tmp_dir/instrumented.o" -o "$tmp_dir/program"

echo "Instrumented MLIR: $tmp_dir/instrumented.mlir"
"$tmp_dir/program"
