#! /bin/bash

# Parameter:
#	* source_files
#	* out_directory

echo "=== Build cscope ==="
echo " |- source_file : ${frvim_source_file}"
echo " |- out_directory : ${frvim_out_directory}"

echo " ... building"
cscope -i ${frvim_source_file} -kb -f _cscope.out
mv _cscope.out ${frvim_out_directory}/cscope.out

echo "=== End Build cscope ==="

