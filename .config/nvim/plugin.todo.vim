
"" TODO: create an operator:
"" ip<operator> deletes trailing chars in the paragraph
"fun! s:CleanTrailingSpaces(type, ...)
"    let sel_save = &selection
"    let &selection = "inclusive"
"    if a:0  " Invoked from Visual mode, use gv command.
"        silent exe "normal! gv"
"    elseif a:type == 'line'
"        "silent exe "normal! '[V']"
"    else
"        silent exe "normal! `[v`]"
"    endif
"    exe "silent! '<,'>s/\\s\\+$//g"
"    exe "normal! "
"    let &selection = sel_save
"endfun

" TODO: create an operator:
" ip<operator> adds nbsp in the paragraph
"fun! s:NonBreakableSpaces(type, ...)
"    "let sel_save = &selection
"    "let &selection = "inclusive"
"    "let reg_save = @@

"    if a:0  " Invoked from Visual mode, use gv command.
"        silent exe "normal! gv"
"    elseif a:type == 'line'
"        silent exe "normal! '[V']"
"    else
"        silent exe "normal! `[v`]"
"    endif

"    exe "silent! s/(\S) ([:;?!])/\1 \2/g"

"    "let &selection = sel_save
"    "let @@ = reg_save
"endfunction
