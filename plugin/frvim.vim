if exists("g:loaded_frvim_plugin")
    finish
endif
let g:loaded_frvim_plugin = 1

" Setting {{{1
set cscopequickfix=s-,c-,d-,i-,t-,e-
" }}}1

" Command {{{1
command! FrvimUpdateAll call frvim#UpdateAll()
command! FrvimUpdate call frvim#Update()
command! FrvimVersion call frvim#Version()
command! FrvimNewPro call frvim#CreateProject()
command! FrvimAddCppBaseTags call frvim#AddCppBaseTags()	
"}}}1

" Auto Command {{{1

" new C/C++ file configuration {{{2
augroup C_and_CPP_Group
	autocmd!
    autocmd BufNewFile,BufRead *.c,*.h,*.cpp,*.hpp setfiletype cpp
    autocmd BufNewFile *.hpp,*.cpp,*.h,*.c execute ":call frvim#function#SetTitle()"
    autocmd BufNewFile *.hpp,*.h execute ":call frvim#function#DefineHeadFile()"
    autocmd BufNewFile *.cpp,*.c execute ":call frvim#function#DefineCppFile()"
	
	autocmd VimEnter * execute "call frvim#Initialization()"
augroup END	
"}}}2

"}}}1

