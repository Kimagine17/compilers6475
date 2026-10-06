#!/bin/bash

export FILE=$1
export OUTFILE=$2
export PLUGIN=/uufs/chpc.utah.edu/common/home/u1592458/mlir-analysis-pass/build/ZeroAnalysis.so

mlir-translate --import-llvm $1 | \
mlir-opt --load-pass-plugin=$PLUGIN --pass-pipeline="builtin.module(ext-analysis)" -o $2 2>&1
