#! /bin/bash

# Parameter:
#	* source_files
#	* out_directory

echo "=== Build tags ==="
echo " |- source_file : ${frvim_source_file}"
echo " |- out_tags_file : ${frvim_out_file}"

rm -f ${frvim_out_file}
ctags --c++-kinds=+p --fields=+iaS --extra=+q --langmap=c++:+.inl -o ${frvim_out_file} -L ${frvim_source_file}

echo "=== End Build tags ==="

