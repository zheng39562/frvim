if exists("g:loaded_frvim_autoload_project_property")
    finish
endif
let g:loaded_frvim_autoload_project_property = 1

let s:project_property = {}

function frvim#project_property#Clear() " {{{2
	s:project_property = {}
endfunction " }}}2

" project_name = ""
" # 匹配目录(use ',' to split path)
" folder_pattern = ./,../
" # 文件匹配
" file_pattern = *h,*c,*cc,*cpp,*hpp
" # 文件过滤(先进行匹配，再进行过滤)
" file_filter = *boost*
" 首字母为字母
" '#' 开头为注释
" '=' 前后的空格会被删除.
function frvim#project_property#Parse() " {{{2
	call frvim#project_property#Clear()

	for line in getline(1,'$')	
		
	endfor
endfunction " }}}2
		
function frvim#project_property#LoadConfigFile(project_file) " {{{2
endfunction " ]}}2



