#! /bin/bash

######################################################################################
# parameter (folder_pattern, file_pattern, file_filter, out_path)
######################################################################################

function GetArray()
{
	OLD_IFS="$IFS" 
	IFS="," 
	DATA_ARRAY=($1) 
	IFS="$OLD_IFS" 

	echo ${DATA_ARRAY[*]}
}


# ./tools/shell/update_files.sh ./ *h,*c,*cc,*cpp,*hpp *update_file* ./
echo "=== Find Files ==="
echo " |- folder pattern : [${frvim_folder_pattern_array}]"
echo " |- file pattern : [${frvim_file_pattern_array}]"
echo " |- file filter : [${frvim_file_filter_array}]"
echo " |- out file : [${frvim_out_file}]"

folder_pattern_array=(`GetArray ${frvim_folder_pattern_array}`)
file_pattern_array=(`GetArray ${frvim_file_pattern_array}`)
file_filter_array=(`GetArray ${frvim_file_filter_array}`)

echo " ... clean old files : ${frvim_out_file}"
rm -f ${frvim_out_file}
touch -f ${frvim_out_file}

echo " ... parse pattern "
include_file_pattern=""
for file_pattern_item in ${file_pattern_array[@]} 
do 
	if [ "${include_file_pattern}" == "" ] ; then
		include_file_pattern="-iname ${file_pattern_item}"
	else
		include_file_pattern="${include_file_pattern} -or -iname ${file_pattern_item}"
	fi
done
if [ "${include_file_pattern}" == "" ] ; then
	include_file_pattern="-iname *"
fi

exclude_file_pattern=""
for file_filter_item in ${file_filter_array[@]} 
do 
	exclude_file_pattern="${exclude_file_pattern} -not -iname ${file_filter_item} -and "
done

echo " ... finding"
folder_pwd_tmp=""
for folder_pattern_item in ${folder_pattern_array[@]} 
do 
	folder_pwd_tmp=$(cd "${folder_pattern_item}"; pwd)
	echo "find ${folder_pwd_tmp} ${exclude_file_pattern} ${include_file_pattern} >> ${frvim_out_file}"
	find ${folder_pwd_tmp} ${exclude_file_pattern} ${include_file_pattern} >> ${frvim_out_file}
done

echo "=== End Find Files ==="



