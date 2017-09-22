if exists("g:loaded_frvim_plugin")
    finish
endif
let g:loaded_frvim_plugin = 1

" Command {{{1
command! FrvimUpdateAll call frvim#UpdateAll()
command! FrvimUpdate call frvim#Update()
command! FrvimVersion call frvim#Version()
command! FrvimNewPro call frvim#CreateProject()
"}}}1

" Auto Command {{{1

" new C/C++ file configuration {{{2
augroup C_and_CPP_Group
	autocmd!
    autocmd BufNewFile,BufRead *.c,*.h,*.cpp,*.hpp setfiletype cpp
    autocmd BufNewFile *.hpp,*.cpp,*.h,*.c execute ":call frvim_interface#function#SetTitle()"
    autocmd BufNewFile *.hpp,*.h execute ":call frvim_interface#function#DefineHeadFile()"
    autocmd BufNewFile *.cpp,*.c execute ":call frvim_interface#function#DefineCppFile()"

    "autocmd FileType c,cpp :set omnifunc=ccomplete#Complete;
    "autocmd FileType c,cpp :set omnifunc=omni#cpp#complete#Main
	
	autocmd VimEnter * execute "call frvim#Initialization()"
augroup END	
"}}}2

"}}}1

