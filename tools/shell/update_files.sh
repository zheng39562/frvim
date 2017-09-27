#! /bin/bash

######################################################################################
# parameter (folder_pattern, file_pattern, file_filter, out_path)
######################################################################################

# ./tools/shell/update_files.sh ./ *h,*c,*cc,*cpp,*hpp *update_file* ./
echo "=== Find Files ==="
echo " |- folder pattern : [${frvim_folder_pattern_array}]"
echo " |- file pattern : [${frvim_file_pattern_array}]"
echo " |- file filter : [${frvim_file_filter_array}]"
echo " |- out file : [${frvim_out_file}]"

echo " ... clean old files : ${frvim_out_file}"
rm -f ${frvim_out_file}
touch -f ${frvim_out_file}

echo " ... parse pattern [${file_pattern_array[@]}]"
tmp="${frvim_file_pattern_array},"
include_file_pattern=""
while [ "${tmp}" != "" -a "${tmp}" != "," ]
do 
	file_pattern_item=${tmp%%,*}

	if [ "${include_file_pattern}" == "" ] ; then
		include_file_pattern="-iname '${file_pattern_item}'"
	else
		include_file_pattern="${include_file_pattern} -or -iname '${file_pattern_item}'"
	fi

	tmp=${tmp#*,}
done
if [ "${include_file_pattern}" == "" ] ; then
	include_file_pattern="-iname *"
fi

tmp="${frvim_file_filter_array},"
exclude_file_pattern=""
while [ "${tmp}" != "" -a "${tmp}" != "," ]
do 
	file_filter_item=${tmp%%,*}

	exclude_file_pattern="${exclude_file_pattern} -not -iname ${file_filter_item} -and "

	tmp=${tmp#*,}
done

echo " ... finding"

rm -f tmp_tmp_tmp_tmp_tmp_tmp_file.sh
echo "#! /bin/bash " >> tmp_tmp_tmp_tmp_tmp_tmp_file.sh

tmp="${frvim_folder_pattern_array},"
folder_pwd_tmp=""
while [ "${tmp}" != "" -a "${tmp}" != "," ]
do 
	folder_pattern_item=${tmp%%,*}
	folder_pwd_tmp=$(cd "${folder_pattern_item}"; pwd)
	# shell 内 find 使用全参数模式 会出现一定问题。所以使用临时文件的方式解决.
	echo "find ${folder_pwd_tmp} ${exclude_file_pattern} ${include_file_pattern} >> ${frvim_out_file}" >> tmp_tmp_tmp_tmp_tmp_tmp_file.sh

	tmp=${tmp#*,}
done

sh tmp_tmp_tmp_tmp_tmp_tmp_file.sh
rm -f tmp_tmp_tmp_tmp_tmp_tmp_file.sh

echo "=== End Find Files ==="

exit;

