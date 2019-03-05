if exists("g:loaded_frvim_autoload_function")
    finish
endif
let g:loaded_frvim_autoload_function = 1

function! frvim#function#DefineHeadFile() 
    execute ":normal! G$"
	call setline( line("."), "#ifndef _".expand("%:t:r")."_H" )
    call setline( line(".")+1, "#define _".expand("%:t:r")."_H" )
    call setline( line(".")+2, "#endif " )
    call setline( line(".")+3, "" )
    execute ":normal! G$"
endfunction 

function! frvim#function#DefineCppFile() 
    silent execute ":normal! G$"
	call setline( line("."), "#include \"".expand("%:t:r").".h\"" )
    silent execute ":normal! G$"
endfunction 

function! frvim#function#SetTitle() 
	let titleList = [ ]
	call add(titleList, " \\file ".expand("%:t"))
	call add(titleList, " \\brief")
	call add(titleList, " \\note	注意事项： ")
	call add(titleList, "")
	call add(titleList, "\\version ")
	call add(titleList, "* \\author zheng39562@163.com")

    if &filetype == 'cpp'
		let curList = 1
		call setline( curList, "/**********************************************************" )

		for title in titleList 
			let curList = curList + 1
			call setline( curList, " * ".title )
		endfor 
		call setline( curList + 1, "**********************************************************/" )
		call setline( curList + 2, "" )
    else
        echom "filetype is ".&filetype
    endif

    execute ":normal! G$"
endfunction 

function! frvim#function#GetPluginPath() 
	let l:path_bak = getcwd()
	execute "cd ~"
	let l:plugin_path = getcwd() . "/" . finddir("frvim", getcwd()."/.vim/**4")
	execute "cd ".l:path_bak

	return l:plugin_path
endfunction 


