
" Method {{{1

let g:frvim_active_environment = 0
function! frvim_plugin#config#Initialization() " {{{2
	let absolute_path=getcwd()

	let config_file = findfile("./.frvim.vim");

	if !empty(config_file)
		let g:frvim_active_environment = 1;
	endif

	return g:frvim_active_environment;
endfunction " }}}2

function! frvim_plugin#config#UpdateAll() " {{{2
endfunction " }}}2

function! frvim_plugin#config#UpdateAll()
endfunction

function! UpdateCscopeInfo() " {{{2
	let absolutePath=getcwd()
	silent! execute "! cscope -Rbq -I ".absolutePath."/src 2>>error.cs.log" 
	silent! execute "cs add ".absolutePath."/cscope.out"
endfunction " }}}2

function! UpdateTags() " {{{2
	silent! execute "! /usr/bin/rm -rf tags"
	silent! execute "! touch tags"
	silent! execute "! find . -iname '*.c' -or -iname '*.cpp' -or -iname '*.hpp' -or -iname '*.h' | xargs ctags --c++-kinds=+p --fields=+iaS --extra=+q --langmap=c++:+.inl -a tags "
endfunction " }}}2

" }}}1

