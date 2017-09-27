if exists("g:loaded_frvim_autoload")
    finish
endif
let g:loaded_frvim_autoload = 1

function! frvim#Version() " {{{2
	return '1.0.0'
endfunction " }}}2

let g:frvim_active_environment = 0
let g:frvim_plugin_path = frvim#function#GetPluginPath()
let g:frvim_plugin_tool_path = g:frvim_plugin_path . "/tools/shell/"
let g:frvim_plugin_doc_path = g:frvim_plugin_path . "/doc/"

" script variable {{{2
let s:project_name = ""
let s:out_directory = ""
let s:folder_pattern = ""
let s:file_pattern = ""
let s:file_filter = ""
let s:out_source_files_file = ""
" }}}2


function frvim#CreateProject() " {{{2
	"let l:absolute_path = getcwd()."/"
"	silent! execute "! cp " . g:frvim_plugin_doc_path . "frvim.cfg " . l:absolute_path . ".frvim.cfg"
"	execute ":vi " . l:absolute_path . ".frvim.cfg"

	silent 1,$d _
	silent call append (0, [
			\ "# frvim configure.",
			\ "",
			\ "# 一个项目暂时只有一个配置。不支持多配置文件方案.",
			\ "",
			\ "# 文件结构介绍",
			\ "#	* .frvim.cfg : 配置表",
			\ "#	* .frvim_{project}_folder : 目录: 本地化脚本 以及 需要的数据",
			\ "#		* files",
			\ "#		* tag",
			\ "#		* cscope.out",
			\ "",
			\ "# 正则表达式的语法还未定",
			\ "",
			\ "project_name = \"\"",
			\ "# 匹配目录(use ',' to split path)",
			\ "folder_pattern = \"./\"",
			\ "# 文件匹配",
			\ "file_pattern = \"*h,*c,*cc,*cpp,*hpp\"",
			\ "# 文件过滤(先进行匹配，再进行过滤)",
			\ "file_filter = \"\"",
			\ "",
			\ "# todo build base cmake ",
			\ ])

	silent execute "w! .frvim.cfg"
	silent execute "normal gg"
endfunction " }}}2

function frvim#InitScript() " {{{2
	let l:file_scirpt = [
	\ '#! /bin/bash',
	\ 'export frvim_folder_pattern_array=' . s:folder_pattern,
	\ 'export frvim_file_pattern_array=' . s:file_pattern,
	\ 'export frvim_file_filter_array=' . s:file_filter,
	\ 'export frvim_out_file=' . s:out_project_directory . 'files',
	\ 'sh ' . g:frvim_plugin_tool_path . 'update_files.sh',
	\ ]
	call writefile(l:file_scirpt, s:out_project_directory . "update_files.sh")

	let l:tag_scirpt = [
	\ '#! /bin/bash',
	\ "export frvim_source_file=" . s:out_source_files_file,
	\ "export frvim_out_file=" . s:out_project_directory . "project.tags",
	\ "sh " . g:frvim_plugin_tool_path . "update_tags.sh",
	\ ]

	call writefile(l:tag_scirpt, s:out_project_directory . "update_tags.sh")

	let l:cscope_scirpt = [
	\ '#! /bin/bash',
	\ "export frvim_source_file=" . s:out_source_files_file,
	\ "export frvim_out_directory=" . s:out_project_directory,
	\ "sh " . g:frvim_plugin_tool_path . "update_cscope.sh",
	\ ]
	call writefile(l:cscope_scirpt, s:out_project_directory . "update_cscope.sh")
endfunction " }}}2

function! frvim#Initialization() " {{{2
	let l:absolute_path = getcwd()
	let l:config_file = findfile("./.frvim.cfg")

	if !empty(l:config_file)
		let g:frvim_active_environment = 1
		call frvim#project_property#LoadConfigFile(l:absolute_path."/".l:config_file)

		let s:project_name = frvim#project_property#GetProperty("project_name")
		if !empty(s:project_name)
			let s:out_project_directory = l:absolute_path . "/." . s:project_name . "_config/"
			let s:out_source_files_file = s:out_project_directory . "files"
			let s:folder_pattern = frvim#project_property#GetProperty("folder_pattern")
			let s:file_pattern = frvim#project_property#GetProperty("file_pattern")
			let s:file_filter = frvim#project_property#GetProperty("file_filter")

			silent! execute "! mkdir -p " . s:out_project_directory

			call frvim#InitScript()
		else
			echoe "project name is not allow empty."
		endif
	endif
endfunction " }}}2

function frvim#UpdateAll() " {{{2
	call frvim#Initialization()
	if !empty(s:project_name)
		echom "frvim#UpdateFiles()"
		call frvim#UpdateFiles()
		echom "frvim#Update()"
		call frvim#Update()
	else
		echoe "project name is not allow empty."
	endif
endfunction " }}}2

function frvim#Update() " {{{2
	silent! execute "! sh " . s:out_project_directory . "update_tags.sh"
	silent! execute "! sh " . s:out_project_directory . "update_cscope.sh"
endfunction " }}}2

function frvim#UpdateFiles() " {{{2
	silent! execute "! sh " . s:out_project_directory . "update_files.sh"
endfunction " }}}2


