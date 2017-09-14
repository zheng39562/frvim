#! /bin/bash

# Parameter:
#	* source_files
#	* out_directory

source_files=$1
out_directory=$2

echo "=== Build cscope ==="
echo " |- source_files : ${source_files}"
echo " |- out_directory : ${out_directory}"

echo " ... building"
cscope -i ${source_files} -kb -f _cscope.out
mv _cscope.out ${out_directory}/cscope.out

echo "=== End Build cscope ==="

