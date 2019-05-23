
" -----------------------------------------------------------------------------
" Autocommands
" -----------------------------------------------------------------------------
if has("autocmd")

    " File type detection
    augroup fileDetect
        au!
        " When editing a file, always jump to the last known cursor position.
        " Don't do it for commit messages, when the position is invalid, or when
        " inside an event handler (happens when dropping a file on gvim).
        " From https://github.com/thoughtbot/dotfiles/blob/master/vimrc
        au BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
            \ exe "silent! normal g`\"za" |
        \ endif

        au BufEnter *.zsh-theme setlocal filetype=zsh
        au BufRead,BufNewFile *.phtml setlocal filetype=php
        au BufRead,BufNewFile *.json setlocal filetype=json
        au BufRead,BufNewFile .jshintrc setlocal filetype=json
        au BufRead,BufNewFile *mutt-* setlocal filetype=mail
        au BufEnter Makefile setlocal noexpandtab
        " Special settings for passwords files
        au BufEnter /dev/shm/* setlocal nobackup noswapfile noundofile
    augroup END
    " }}}

    " File type settings {{{
    augroup fileTypes
        au!

        " Tab settings
        au FileType sass,pug,html,yaml setlocal sts=2 sw=2 ts=2

        " HTML/CSS mapping
        au FileType html,css,scss,sass EmmetInstall
        au FileType html,css,sass,less
            \ imap <buffer> <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

        " omnifunc by types
        au FileType html,markdown  setlocal omnifunc=htmlcomplete#CompleteTags
        au FileType xml            setlocal omnifunc=xmlcomplete#CompleteTags
        au FileType java           setlocal omnifunc=javacomplete#Complete
        au FileType javascript     setlocal formatprg=prettier\ --stdin

        " formating by types
        " au FileType vim       setlocal fdl=0
        au FileType text      setlocal tw=78 fo+=tw
        au FileType markdown  setlocal tw=80 fo+=tw
        au FileType gitcommit setlocal tw=72 cc=72 fo+=taw
        " Mail: remove annoying trail space detection and set gutter
        " fo+=aw is for mutt text_flowed option
        au FileType mail setlocal tw=72 fo+=aw fo-=t listchars=tab:\ \ 

        " disable deoplete auto-complete for text files
        autocmd FileType text,mail
                \ call deoplete#custom#buffer_option('auto_complete', v:false)
    augroup END
    " }}}

    " ------------------------------------------------------------------------
    " Spell configuration
    " ------------------------------------------------------------------------
    if has("spell")
        augroup spell
            au!
            au FileType text,mail,markdown,gitcommit setlocal spell spl=en,fr
            au FileType help setlocal nospell
        augroup END
    end

else
    set autoindent
endif
