#! /bin/bash

# Parameter:
#	* source_files
#	* out_directory

echo "=== Build cscope ==="
echo " |- source_file : ${frvim_source_file}"
echo " |- out_directory : ${frvim_out_directory}"

echo " ... building"
echo "cscope -i ${frvim_source_file} -kb -f _cscope.out"
cscope -i ${frvim_source_file} -kbq -f _cscope.out
mv _cscope.out ${frvim_out_directory}/cscope.out
mv _cscope.out.in ${frvim_out_directory}/cscope.out.in
mv _cscope.out.po ${frvim_out_directory}/cscope.out.po

echo "=== End Build cscope ==="

