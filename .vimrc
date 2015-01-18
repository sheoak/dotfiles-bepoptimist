"https://github.com/tpope/vim-fugitive""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: sheoak
" Version:    O.11
"
" I use this config mainly for:
"
" - Programming under git versionning (PHP/JS/HTML/CSS)
" - Text/Mail editing
"
" I used http://dougblack.io/words/a-good-vimrc.html post to help me organize
" and used a few settings/functions suggested.
"
" I also used some of Doug Ireton mirror pond settings
" https://github.com/dougireton/mirror_pond/blob/master/vimrc
"
" Thank you to all the people behind the plugins I use, it’s awesome!
"
" TODO: clean mappings and improve
" TODO: remap $ / ^
" TODO: paste mapping (system/mouse/xclip, unite yank…)
" TODO: custom templates licence
"
" Dependencies:
" -----------------------------------------------------------------------------
"
" - git
" - ag : optional but really faster with unite
"   https://github.com/ggreer/the_silver_searcher
"
" Installation:
" -----------------------------------------------------------------------------
"
" Copy this file to ~/.vimrc as well as other needed files:
"
" - .vimrc.typematrix.keyboard if you want to use typematrix mappings
" - .vimrc.bepo.keymap if you are using bepo layout
" - .vimrc.local if you want to override settings only on your local machine
" - .vimrc.bundles.local if you want to add plugins only on your local machine
" - .vimrc.mac if you are using vim on a mac (experimental)
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Keyboard / keymap specific mapping {{{
" I use it for typeMatrix mappings and bepo mapping
" This will include all files matching ~/.vimrc.*.key*
for fpath in split(globpath('~/', '.vimrc.*.key*'), '\n')
  exe 'source' fpath
endfor

" }}}

" Vundle {{{
" -----------------------------------------------------------------------------

" We want to be able to run without plugins, but print an error
if !isdirectory($HOME . '/.vim/bundle/Vundle.vim')
    echohl "Vundle not found, running without plugin"
    let s:plugin_off = 1
else
    filetype off
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " Themes
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'morhetz/gruvbox'

    " Favorites
    Plugin 'Shougo/unite.vim'
    Plugin 'Shougo/vimproc.vim'             " Unite deps for file_sync
    Plugin 'Shougo/neomru.vim'              " Unite deps for file_mru
    Plugin 'tpope/vim-fugitive'             " Git integration
    Plugin 'airblade/vim-gitgutter'         " Git gutter on the left
    Plugin 'bling/vim-airline'              " Cool status bar

    Plugin 'tpope/vim-commentary'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-repeat'
    Plugin 'tpope/vim-speeddating'
    Plugin 'sjl/gundo.vim'
    "Plugin 'kien/ctrlp.vim'
    Plugin 'mattn/emmet-vim'
    Plugin 'godlygeek/tabular'
    Plugin 'tomtom/tlib_vim'
    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'sirver/ultisnips'
    Plugin 'honza/vim-snippets'
    Plugin 'aperezdc/vim-template'
    Plugin 'sheoak/vim-mucfind'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'joonty/vdebug'
    " Plugin 'jaredly/vim-debug'
    Plugin 'tobyS/vmustache'
    Plugin 'tobyS/pdv'

    Plugin 'scrooloose/syntastic'

    " Filetype specific plugins
    Plugin 'PotatoesMaster/i3-vim-syntax'            " i3
    Plugin 'digitaltoad/vim-jade'                    " jade
    Plugin 'plasticboy/vim-markdown'                 " markdown
    Plugin 'hail2u/vim-css3-syntax'                  " CSS3
    " Plugin 'cakebaker/scss-syntax.vim'             " SASS. Broken for .sass?
    Plugin 'othree/javascript-libraries-syntax.vim'  " Javascript
    Plugin 'jelera/vim-javascript-syntax'
    Plugin 'vim-scripts/JavaScript-Indent'
    Plugin 'burnettk/vim-angular'
    " Plugin 'pangloss/vim-javascript'
    Plugin 'elzr/vim-json'                           " JSON

    " Use local bundles config if available
    if filereadable(expand("~/.vimrc.bundles.local"))
        source ~/.vimrc.bundles.local
    endif

    " TODO: test me!
    " Plugin 'tpope/vim-projectionist'
    " Plugin 'tpope/vim-jdaddy'
    " Plugin 'tpope/vim-unimpaired'

    " All of your Plugins must be added before the following line
    call vundle#end()            " required
endif

filetype plugin indent on    " required

" }}}

" Basic vim settings {{{
" -----------------------------------------------------------------------------
set hidden                     " no alert if current buffer has not been saved
set modeline                   " enable modelines comments
set modelines=1
set tags=.ctags                " search for tags file where vim is open
set fileformat=unix            " unix format by default, of course
set visualbell                 " no sounds
set noerrorbells
set shell=zsh                  " shell zsh by default
" }}}

" Backup / history / undo {{{
" -----------------------------------------------------------------------------
set history=500                " keep 500 lines of command line history
set backup
set backupdir=~/.vim/backups,/tmp/
set directory=~/.vim/backups/swap/,/tmp/
set writebackup
set backupskip=/tmp/*,~/.Backups/*,*.tmp/*,*.cache/*

" Persistent Undo
" Keep undo history across sessions, by storing in file.
" -----------------------------------------------------------------------------
if has('persistent_undo')
    set undodir=~/.vim/backups/undo,/tmp/
    set undofile
endif
" }}}

" Editing {{{
" -----------------------------------------------------------------------------
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set shiftwidth=4
set expandtab           " tabs are spaces
set listchars=nbsp:·,trail:¤,tab:\ \ 
set list
set backspace=indent,eol,start  " allow all backspacing in insert mode
set clipboard=unnamed           " yank to the system clipboard by default

set showmatch                   " when inserting a bracket, briefly jump to
                                " its match

set nojoinspaces                " Use only one space after '.' when joining
                                " lines, instead of two

set nrformats-=octal            " don't treat numbers with leading zeros as
                                " octal when incrementing/decrementing

set diffopt+=vertical           " start diff mode with vert. splits by default

if v:version > 703 || v:version == 703 && has("patch541")
    set formatoptions+=j        " delete comment char on second line when
                                " joining two commented lines
endif

" }}}

" Searching {{{
" -----------------------------------------------------------------------------
set incsearch           " search as characters are entered
set nohlsearch          " highlight matches off
set ignorecase
set smartcase
"set gdefault            " Add the g flag to search/replace by default
" }}}

" Folding {{{
" -----------------------------------------------------------------------------
set foldenable          " enable folding
"set nofoldenable        "dont fold by default
set foldlevelstart=10   " open most folds by default
set foldnestmax=2       " 10 nested fold max
set foldmethod=indent   " fold based on indent level
" }}}

" UI {{{
" -----------------------------------------------------------------------------
set nonumber            " do not show line number
set cursorline          " highlight current line
set colorcolumn=80
set showcmd             " display incomplete commands
set noshowmode          " already in airline
set lazyredraw          " redraw only when we need to
set ttyfast             " indicates a fast terminal connection, faster redraw
set showmatch           " highlight matching [{()}]
set ruler               " show the cursor position all the time
set scrolloff=6         " nb of screen lines to keep above and below the cursor.
"set sidescrolloff=15
"set sidescroll=1
set guioptions=a
set mouse=a             " enable mouse support
set helpheight=100      " Set window height when opening Vim help windows
set confirm             " Ask to save buffer instead of failing

set nowrap              " Don't wrap lines
set linebreak           " Wrap lines at convenient points

set wildignore+=*.o,*.obj,.git,*.jpg,*.png,*.gif,*.pdf,*.doc,*.swp,*.swf,*.bak
set wildignore+=*.zip,*.tar,*.gz,*.ico,*.ttf,*.eot,*/tmp/*,*/node_modules/*
set wildignore+=*.exe,*.mov,*.msi,*.xls,.ctags,*vim/backups*,*sass_cache*
set wildignore+=*DS_Store*

set wildmenu            " Better command-line completion

" Add guard around 'wildignorecase' to prevent terminal vim error
if exists('&wildignorecase')
    set wildignorecase
endif

set previewheight=20    " preview window height

" }}}

" Theme settings {{{
" -----------------------------------------------------------------------------
if has("gui_running")
    set background=light
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
else
    set background=dark
endif

try
    colorscheme solarized
    "colorscheme gruvbox
catch
    colorscheme desert
endtry

" Color for xiterm, rxvt, nxterm, color-xterm:
if has("terminfo") && g:colors_name == 'solarized'
    set t_Co=16     " better for solarized theme
else
    set t_Co=256
endif

if has("syntax")
  syntax on
endif


" }}}

" Autocommands {{{
" Only do this part when compiled with support for autocommands.
" -----------------------------------------------------------------------------
if has("autocmd")

    " Vim settings {{{
    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " When editing a file, always jump to the last known cursor position.
        " Don't do it for commit messages, when the position is invalid, or when
        " inside an event handler (happens when dropping a file on gvim).
        " From https://github.com/thoughtbot/dotfiles/blob/master/vimrc
        autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal g`\"" |
        \ endif

        " autoreload vimrc
        " autocmd bufwritepost .vimrc source %

    augroup END
    " }}}

    " File type detection {{{
    augroup fileDetect
        au!

        " save folding
        " FIXME: breaks after a while, too many files
        "autocmd BufWinLeave *.* mkview!
        "autocmd BufWinEnter *.* silent loadview
        "
        autocmd BufEnter *.zsh-theme            setlocal filetype=zsh

        " Markdown type
        autocmd BufRead,BufNewFile *.phtml      setlocal filetype=php

        " JSON type
        autocmd BufRead,BufNewFile *.json       setlocal filetype=json
        autocmd BufRead,BufNewFile .jshintrc    setlocal filetype=json

        " Mail type
        autocmd BufRead,BufNewFile *mutt-*      setlocal filetype=mail

        autocmd BufEnter Makefile setlocal noexpandtab

    augroup END
    " }}}

    " File type settings (autocmd) {{{
    augroup fileTypes
        au!


        " Tab settings
        " FIXME useful?
        autocmd FileType sass         setlocal softtabstop=2 shiftwidth=2 tabstop=2
        autocmd FileType javascript   setlocal softtabstop=0 shiftwidth=4 tabstop=4
        autocmd FileType jade         setlocal softtabstop=2 shiftwidth=2 tabstop=2

        " TODO: check if it works
        autocmd FileType php          setlocal omnifunc=phpcomplete#CompletePHP

        autocmd FileType vim          setlocal foldmethod=marker foldlevel=0

        " Strip whitespace on save on some files
        autocmd FileType javascript   autocmd BufWritePre <buffer> CleanWhiteSpace

    augroup END
    " }}}

else

    set autoindent

endif " has("autocmd")
" }}}

" Custom functions {{{
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" -----------------------------------------------------------------------------
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
            \ | wincmd p | diffthis

command! CleanWhiteSpace silent! %s/\s\+$//

" }}}

" Mappings {{{
" -----------------------------------------------------------------------------

" Global mapping {{{
let mapleader = ","     " default leader is a bad in azerty and bépo keyboards

" remap \ to , instead of using mapleader, to avoid losing ',' map
noremap \ ,
noremap , \

"imap <ESC> <ESC>:echo "Use CTRL-C, ESC is disabled!"<CR>

" }}}

" Edition mapping {{{
" -----------------------------------------------------------------------------

" Don't use Ex mode, use Q for formatting
map Q gq

" Sudo save
command! W w !sudo tee % > /dev/null

" FN mappings, F5-F12 are taken by debugger
map <F1> <nop>
map <F2> :set invpaste<CR>
map <F3> <nop>
map <F4> <nop>

" Paste to system/clipboard buffer
map <leader>v "*p
map <leader>V "+p

" }}}

" Navigation mapping {{{
" -----------------------------------------------------------------------------

" up/down arrow to navigate wrapped lines
map <up>   gs
map <down> gt
" cycle buffer forward
map <Tab> :bn<CR>
" cycle buffer backward
map <S-Tab> :bp<CR>
" close buffer / all buffers / window / all windows
map <leader>k :bd<CR>
map <leader>K :bufdo :bd<CR>
map <leader>q :q<CR>
map <leader>Q :q!<CR>
map <leader>, :w<CR>
map <leader>; :W<CR>

" }}}

" Spell mappings {{{
" If you are using bépo, see vimrc.bepo
" -----------------------------------------------------------------------------
if has("spell")

    command! English setlocal spell! spelllang=en
    command! French  setlocal spell! spelllang=fr
    command! Nospell setlocal nospell

    augroup spell

        au!

        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text  setlocal
            \ tw=78
            \ spell spelllang=fr

        autocmd FileType markdown setlocal
            \ tw=80
            \ spell spelllang=en

        " Mail: remove annoying trail space detection and set gutter
        autocmd FileType mail
            \ setlocal tw=72
            \ spell spelllang=fr
            \ listchars=tab:\ \

    augroup END
end
" }}}z

" }}}

" Plugins configuration {{{
" -----------------------------------------------------------------------------

" Plugin vim-solarized {{{
" -----------------------------------------------------------------------------
let g:solarized_termtrans=0
" }}}

" Plugin Emmet {{{
" -----------------------------------------------------------------------------
let g:user_emmet_install_global = 0
autocmd FileType html EmmetInstall
"autocmd FileType html,css,scss,sass EmmetInstall
" }}}

" Plugin Syntastic {{{
" -----------------------------------------------------------------------------
let g:syntastic_stl_format          = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_enable_perl_checker = 1
let g:syntastic_enable_signs        = 1
let g:syntastic_check_on_open       = 1
let g:syntastic_enable_signs        = 1
let g:syntastic_check_on_open       = 1
let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "sv-"']
" }}}

" Plugin TagBar {{{
" -----------------------------------------------------------------------------
let g:tagbar_usearrows = 1
map <leader>t :TagbarToggle<CR>
" }}}

" Plugin Tabularize {{{
" -----------------------------------------------------------------------------
vmap <C-j> :Tabularize/=<CR>
if exists(":Tabularize")
  nmap <Leader>= :Tabularize /=<CR>
  vmap <Leader>= :Tabularize /=<CR>
  nmap <Leader>: :Tabularize /:\zs<CR>
  vmap <Leader>: :Tabularize /:\zs<CR>
endif
" }}}

" Plugin Unite {{{
let g:unite_source_history_yank_enable = 1

" Default Unite buffer, async recursive
nnoremap <leader><space> :Unite -no-split -start-insert file_rec/git<cr>
"nnoremap <leader>f :Unite -no-split -start-insert file_rec/async:!<cr>
nnoremap <leader>f :Unite -no-split -start-insert file_rec/async<cr>
" Yank history
nnoremap <leader>y :Unite history/yank<cr>
" Buffer switching
nnoremap <leader>m :Unite -quick-match buffer<cr>

nnoremap <leader>j :Unite -no-split buffer<cr>
nnoremap <leader>l :Unite -no-split -start-insert file_mru<cr>
nnoremap <leader>y :Unite -no-split history/yank<cr>

call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern',
    \ '\.svg$\|\.ico\|\.png$\|\.jpg$\|\.tmp/\|vendor/\|node_modules/')
call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:unite_source_rec_max_cache_files=3000

if executable('ag')
    let g:unite_source_rec_async_command= 'ag --nocolor --nogroup
        \ --hidden -g "" -G "\.(js|php|css|sass|json|md|txt|html|jade|scss|less|tex)$"'
endif
"call unite#custom#source('file_rec,file_rec/async', 'max_candidates', 0)
"let g:unite_source_rec_async_command='ag --nocolor --nogroup --ignore ".hg" --ignore ".svn" --ignore ".git" --ignore ".bzr" --hidden -g ""'
"nnoremap <leader>l :Unite -no-split -start-insert outline<cr>
" }}}

" Plugin vim-airline {{{
" -----------------------------------------------------------------------------
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"let g:airline_inactive_collapse=1
"let g:airline_section_z = "%3p%% %{g:airline_symbols.linenr}%#__accent_bold#%4l%#__restore__#U"
" }}}

" Plugin vim-jedi {{{
" -----------------------------------------------------------------------------
let g:ycm_min_num_of_chars_for_completion = 2
" }}}

" Plugin Colorpicker {{{
" -----------------------------------------------------------------------------
"map <leader>col :ColorHex<CR>
"imap <C-R>c <ESC>:ColorHEX<CR>A
"imap <C-R>r <ESC>:ColorHEX<CR>A
" }}}

" Plugin UltiSnips {{{
" -----------------------------------------------------------------------------
"let g:snips_trigger_key = '<S-tab>'
let g:UltiSnipsExpandTrigger="<c-g>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-p> :call pdv#DocumentWithSnip()<CR>

" }}}

" Vim template {{{
" -----------------------------------------------------------------------------
" Try to get email and name from git
let g:email=system("git config --list | grep user.email | cut -d'=' -f2")
let g:username=system("git config --list | grep user.name | cut -d'=' -f2")

" Plugin vim-template
let g:snips_author = username . "<" . email . ">"
" }}}

" vim-fugitive {{{
" https://github.com/tpope/vim-fugitive
" -----------------------------------------------------------------------------
nmap <leader>gs :Gstatus<CR><C-w>20+
nmap <leader>ge :Gedit<CR>
nmap <leader>ga :Gadd<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gp :Gpush<CR>
nmap <leader>gc :Gcommit<CR>
" }}}

" }}} plugins section

" Specific settings (keyboard, machine, OS…) {{{
" -----------------------------------------------------------------------------
" Mac settings
if (has("mac") || has("macunix")) && filereadable(expand("~/.vimrc.mac"))
    source ~/.vimrc.mac
endif

" Allow overriding these settings
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" }}}
