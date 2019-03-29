if exists("g:loaded_frvim_autoload")
    finish
endif
let g:loaded_frvim_autoload = 1

function! frvim#Version() 
	return '1.0.0'
endfunction 

function frvim#searchWord()	
	let s:ack_word = expand('<cword>')
	execute "Ack " . s:ack_word
endfunction


