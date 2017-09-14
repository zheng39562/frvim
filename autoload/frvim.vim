if exists("g:loaded_frvim_autoload")
    finish
endif
let g:loaded_frvim_autoload = 1

function! frvim#Version() " {{{2
	return '1.0.0'
endfunction " }}}2

let g:frvim_active_environment = 0
function! frvim#Initialization() " {{{2
	let absolute_path = getcwd()
	let config_file = findfile("./.frvim.vim")

	if !empty(l:config_file)
		let g:frvim_active_environment = 1
		frvim#project_property#LoadConfigFile(l:absolute_path."/".l:config_file)
	endif
endfunction " }}}2

function! frvim#UpdateAll() " {{{2
	call frvim#UpdateFiles()
	call frvim#Update()
endfunction " }}}2

function! frvim#Update(source_file, out_directory) " {{{2
	silent! execute "! sh tools/shell/update_tags.sh ".a:source_file." ".a:out_directory
	silent! execute "! sh tools/shell/update_cscope.sh ".a:source_file." ".a:out_directory
endfunction " }}}2

function! frvim#UpdateFiles(folder_pattern, file_pattern, file_filter, out_file) " {{{2
	silent! execute "! sh tools/shell/update_files.sh ".a:folder_pattern." ".a:file_pattern." ".a:file_filter." ".a:out_file
endfunction " }}}2

