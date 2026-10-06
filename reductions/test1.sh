#!/bin/bash
# usage: test.sh candidate.ll
export PLUGIN=/uufs/chpc.utah.edu/common/home/u1592458/mlir-analysis-pass/build/ZeroAnalysis.so   # absolute, in case cwd differs
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

mlir-translate --import-llvm "$1" -o "$tmp/c.mlir" 2>/dev/null || exit 1

mlir-opt --load-pass-plugin="$PLUGIN" \
  --pass-pipeline="builtin.module(ext-analysis)" \
  "$tmp/c.mlir" -o /dev/null 2>&1 \
  | grep -E "is " | grep -v "constant" | grep -q .
