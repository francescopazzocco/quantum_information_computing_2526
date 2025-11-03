


































#!/bin/bash

mkdir test_dir
cd test_dir
export MYPATH=test_dir
ls .
cd ..
cat error.txt
rm -r test_dir

