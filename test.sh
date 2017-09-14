#! /bin/bash

# parameter (folder_pattern, file_pattern, file_filter, out_path)
#./tools/shell/update_files.sh ./ *.h,*.c,*.cc,*.cpp,*.hpp *boost* ./test_out
./tools/shell/update_cscope.sh ./test_out/files ./test_out/

