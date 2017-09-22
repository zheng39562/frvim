#! /bin/bash

# Parameter:
#	* source_files
#	* out_directory

rm -f ${frvim_out_file}
ctags --c++-kinds=+p --fields=+iaS --extra=+q --langmap=c++:+.inl -o ${frvim_out_file} -L ${frvim_source_file}


