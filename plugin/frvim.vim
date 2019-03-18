if exists("g:loaded_frvim_plugin")
    finish
endif
let g:loaded_frvim_plugin = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setting 
set cscopequickfix=s-,c-,d-,i-,t-,e-


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command 
command! FrvimUpdateAll call frvim#UpdateAll()
command! FrvimUpdate call frvim#Update()
command! FrvimVersion call frvim#Version()
command! FrvimNewPro call frvim#CreateProject()
command! FrvimAddCppBaseTags call frvim#AddCppBaseTags()	
command! FrvimSearchWord call frvim#searchWord()	
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Command 

" new C/C++ file configuration 
augroup C_and_CPP_Group
	autocmd!
    autocmd BufNewFile,BufRead *.c,*.h,*.cpp,*.hpp setfiletype cpp
    autocmd BufNewFile *.hpp,*.cpp,*.h,*.c execute ":call frvim#function#SetTitle()"
    autocmd BufNewFile *.hpp,*.h execute ":call frvim#function#DefineHeadFile()"
    autocmd BufNewFile *.cpp,*.c execute ":call frvim#function#DefineCppFile()"
	
	autocmd VimEnter * execute "call frvim#Initialization()"
augroup END	

