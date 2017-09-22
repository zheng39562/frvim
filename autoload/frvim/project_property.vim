if exists("g:loaded_frvim_autoload_project_property")
    finish
endif
let g:loaded_frvim_autoload_project_property = 1

let s:project_property = {}

function frvim#project_property#GetProperty(key) " {{{2
	if exists(s:project_property[a:key])
		echoe a:key." can not find from project_property."
		return ""
	else
		return s:project_property[a:key]
	endif
endfunction " }}}2

function frvim#project_property#Clear() " {{{2
	let s:project_property = {}
endfunction " }}}2

" 
" rule : key = "value"
function frvim#project_property#Parse(project_file) " {{{2
	for line in readfile(a:project_file)
		let pos = match(l:line, '\w\+\s*=\s*".*"')
		if pos == -1 
			continue
		endif

		let s:project_property[matchstr(l:line, '\w\+\(\s*\)\@=')] = matchstr(l:line, '\(\w\+\s*=\s*"\)\@<=.*\("\)\@=')
	endfor

	for key in keys(s:project_property)
		return
	endfor

	echo "File Parse Falied."
endfunction " }}}2
		
function frvim#project_property#LoadConfigFile(project_file) " {{{2
	call frvim#project_property#Clear()

	call frvim#project_property#Parse(a:project_file)
endfunction " ]}}2



