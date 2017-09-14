#! /bin/bash

# Parameter:
#	* source_files
#	* out_files

source_files=$1
out_files=$2

rm -f ${out_files}
ctags --c++-kinds=+p --fields=+iaS --extra=+q --langmap=c++:+.inl -o ${out_files} -L ${source_files}


