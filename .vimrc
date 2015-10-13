" Vim main configuration file {{{
"
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
" Thank you to all the people behind the plugins I used, it’s awesome!
"
" TODO: custom templates licence
" TODO: a vim plugin for french langage, with dict and keymaps
" FIXME: registers are inconsistents
" TODO: clean plugins
"
" Dependencies:
" -----------------------------------------------------------------------------
"
" - git:        for vim-fugitive plugin
" - cmake:      to compile YouComplete plugin
" - vundle:     https://github.com/gmarik/Vundle.vim
" - jshint:     for syntastic — npm install -g jshint
" - ag:         optional but really faster with unite
"               https://github.com/ggreer/the_silver_searcher
"
" Installation:
" -----------------------------------------------------------------------------
"
" Copy this file to ~/.vimrc as well as other needed files:
"
" - .vimrc.local if you want to override settings only on your local machine
" - .vimrc.bundles.local if you want to add plugins only on your local machine
"
" YouComplete: (example on ubuntu)
" cd ~/.vim/bundle/YouCompleteMe/
" ./install.sh
"
" Vimproc: (for Unite)
" cd ~/.vim/bundle/vimproc.vim
" make
"
" Tip: Setting your keyboard key repeat and speed high will give you a better
" experince in vim!
"
" Tip: You can remap caplocks to ESC, it’s not done here because it’s better
" to do it system wise, and I use a typematrix, caplocks is far away!
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}

" Vundle {{{
" -----------------------------------------------------------------------------

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" We want to be able to run without plugins, but print an error
if !isdirectory($HOME . '/.vim/bundle/Vundle.vim')
    echohl "Vundle not found, running without plugin"
    let s:plugin_off = 1
else
    filetype off
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " My custom plugins
    " vim-bim muste be before tpope/vim-surround because it disable
    " surround default mapping due to confict with "c" key remap to "l"
    Plugin 'sheoak/vim-bim'                         " Bepo keymap
    Plugin 'sheoak/vim-typematrix'                  " TypeMatrix keymap

    " Plugin 'tpope/vim-sensible'     " Default settings everyone can agree on

    " Themes
    Plugin 'endel/vim-github-colorscheme'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'morhetz/gruvbox'

    " dependencies
    Plugin 'tomtom/tlib_vim'                " utility functions
    Plugin 'tobyS/vmustache'                " vim templates (for phpDoc)
    Plugin 'MarcWeber/vim-addon-mw-utils'   " ?

    " Favorites
    Plugin 'Shougo/neomru.vim'              " Unite deps for file_mru
    Plugin 'Shougo/vimproc.vim'             " Unite deps for file_sync
    Plugin 'Shougo/unite.vim'

    Plugin 'airblade/vim-gitgutter'         " Git gutter on the left
    Plugin 'bling/vim-airline'              " Cool status bar

    Plugin 'tpope/vim-fugitive'             " Git integration
    Plugin 'tpope/vim-surround'             " motions around words
    Plugin 'tpope/vim-repeat'               " missing repeat with dot
    Plugin 'tpope/vim-speeddating'          " inc/dec dates and numbers

    Plugin 'marijnh/tern_for_vim'           " ctags for javascript
    Plugin 'tpope/vim-commentary'           " quick comment

    Plugin 'sjl/gundo.vim'                  " save undo when closing file
    Plugin 'scrooloose/syntastic'           " syntax checking
    Plugin 'mattn/emmet-vim'
    Plugin 'godlygeek/tabular'              " must be BEFORE markdown plugin
    "Plugin 'sirver/ultisnips'
    Plugin 'honza/vim-snippets'
    Plugin 'sheoak/vim-mucfind'             " quickly insert mu result
    Plugin 'joonty/vdebug'                  " multi-language debugger
    " Plugin 'jaredly/vim-debug'

    " Filetype specific plugins
    Plugin 'tmhedberg/matchit'                       " all
    Plugin 'PotatoesMaster/i3-vim-syntax'            " i3 config syntax
    Plugin 'digitaltoad/vim-jade'                    " jade syntax
    Plugin 'plasticboy/vim-markdown'                 " markdown
    Plugin 'hail2u/vim-css3-syntax'                  " CSS3 syntax
    Plugin 'othree/javascript-libraries-syntax.vim'  " Javascript
    Plugin 'tobyS/pdv'                               " phpDocumentor
    Plugin 'jelera/vim-javascript-syntax'
    Plugin 'burnettk/vim-angular'
    Plugin 'elzr/vim-json'                           " JSON
    " Plugin 'tpope/vim-jdaddy' " json manipulation
    Plugin 'vim-pandoc/vim-pandoc'                   " pandoc
    Plugin 'vim-pandoc/vim-pandoc-syntax'

    "Plugin 'vim-scripts/JavaScript-Indent'
    "Plugin 'pangloss/vim-javascript'
    "Plugin 'cakebaker/scss-syntax.vim'             " SASS. Broken for .sass?
    Plugin 'aperezdc/vim-template'
    "Plugin 'Valloric/YouCompleteMe'

    " Use local bundles config if available
    if filereadable(expand("~/.vimrc.bundles.local"))
        source ~/.vimrc.bundles.local
    endif

    " All of your Plugins must be added before the following line
    call vundle#end()            " required
endif

filetype plugin indent on    " required

" }}}

" Basic vim settings {{{
" -----------------------------------------------------------------------------

" Keyboard / keymap specific mapping
" default leader is bad in azerty and bépo keyboards
" we also remap \ to , to avoid losing "f" reverse repeat
let mapleader = ","
noremap \ ,

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
set sessionoptions-=options     " do not save options
set viminfo^=!                  " keep some vim history after closing

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
set complete-=i                       " scan current and included files
set ttimeout
set ttimeoutlen=100                   " time waited before end of sequence
set autoread                          " detect file changed outside of vim
set tabstop=4                         " number of visual spaces per TAB
set softtabstop=4                     " number of spaces in tab when editing
set shiftwidth=4
set expandtab                         " tabs are spaces
set listchars=nbsp:·,trail:¤,tab:\ \  " show invisible nbsp/tabs spaces
set list
set backspace=indent,eol,start        " allow all backspacing in insert mode

set showmatch                   " when inserting a bracket, briefly jump to
                                " its match

set nojoinspaces                " Use only one space after '.' when joining
                                " lines, instead of two

set nrformats-=octal            " don't treat numbers with leading zeros as
                                " octal when incrementing/decrementing

set diffopt+=vertical           " start diff mode with vert. splits by default

 " yank to the system clipboard by default
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
elseif has('clipboard')
    set clipboard=unnamed
endif

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
"set foldenable         " enable folding
set nofoldenable        " dont fold by default
set foldlevelstart=50   " open most folds by default
set foldnestmax=2       " 2 nested fold max
set foldmethod=marker   " fold based on indent level
" }}}

" UI {{{
" -----------------------------------------------------------------------------
set nonumber            " show line number ?
set norelativenumber    " show relative number also ?
set cursorline          " highlight current line
set colorcolumn=80
set showcmd             " display incomplete commands
set showmode            " already in airline?
set lazyredraw          " redraw only when we need to
set ttyfast             " indicates a fast terminal connection, faster redraw
set showmatch           " highlight matching [{()}]
set ruler               " show the cursor position all the time
set scrolloff=6         " nb of screen lines to keep above and below the cursor.
set sidescrolloff=5
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

set display+=lastline   " Show as much as possible of long line (no @)

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
        au BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
            \ exe "silent! normal g`\"za" |
        \ endif

    augroup END
    " }}}

    " File type detection {{{
    augroup fileDetect
        au!

        " save folding
        " FIXME: breaks after a while, too many files
        "au BufWinLeave *.* mkview!
        "au BufWinEnter *.* silent loadview
        au BufEnter *.zsh-theme            setlocal filetype=zsh

        " html mix with php
        au BufRead,BufNewFile *.phtml      setlocal filetype=php

        " JSON type
        au BufRead,BufNewFile *.json       setlocal filetype=json
        au BufRead,BufNewFile .jshintrc    setlocal filetype=json

        " Mail type
        au BufRead,BufNewFile *mutt-*      setlocal filetype=mail

        au BufEnter Makefile setlocal noexpandtab

    augroup END
    " }}}

    " File type settings (autocmd) {{{
    augroup fileTypes
        au!

        " Tab settings
        au FileType sass,jade,html setlocal
            \ softtabstop=2
            \ shiftwidth=2
            \ tabstop=2

        "TODO: remove me?
        "au FileType javascript setlocal softtabstop=0 shiftwidth=4 tabstop=4

        " HTML/CSS mapping
        au FileType html,css,sass,less
            \ imap <buffer> <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

        " omnifunc by types
        au FileType php            setlocal omnifunc=phpcomplete#CompletePHP
        au FileType css,sass,less  setlocal omnifunc=csscomplete#CompleteCSS
        au FileType javascript     setlocal omnifunc=javascriptcomplete#CompleteJS

        " formating by types
        au FileType vim            setlocal foldmethod=marker foldlevel=0
        au FileType text           setlocal tw=78
        " TODO: verify if taken care by plugins
        au FileType markdown       setlocal tw=80 formatoptions+=t
        au FileType gitcommit      setlocal tw=72 colorcolumn=72

        " Mail: remove annoying trail space detection and set gutter
        au FileType mail setlocal tw=72 listchars=tab:\ \

        " Strip whitespace on save on some files
        " au FileType javascript   au BufWritePre <buffer> CleanWhiteSpace

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

" Clean dirty white space (EOL)
command! CleanWhiteSpace silent! %s/\s\+$//

" Sudo save
command! W w !sudo tee % > /dev/null

" }}}

" Spell configuration {{{
" -----------------------------------------------------------------------------
if has("spell")
    augroup spell
        au!
        au FileType text,mail            setlocal spell spelllang=fr
        au FileType markdown,gitcommit   setlocal spell spelllang=en
        au FileType help                 setlocal nospell
    augroup END
end
" }}}

" CTRL+Space for C-x
" Beware of system shortcuts (like keyboard layout toggle)
" TODO: disable ubuntu CTRL-space
inoremap <Nul> <C-x>

" s is not that usefull, S is cc, s is xa
" TODO
" nnoremap s

" cycle between the current/last buffer
nnoremap <Tab> :b#<CR>

" }}}

" Don't use Ex mode, use Q for formatting
map Q gq

nnoremap "" :registers<CR>

" Plugins configuration {{{
" -----------------------------------------------------------------------------

" Plugin vim-solarized {{{
" -----------------------------------------------------------------------------
let g:solarized_termtrans=0
" }}}

" Plugin Emmet {{{
" -----------------------------------------------------------------------------
let g:user_emmet_install_global = 0
au FileType html,css,scss,sass EmmetInstall
let g:user_emmet_leader_key='<C-g>'
"imap <C-g>g <C-g>,
" }}}

" Plugin Syntastic {{{
" -----------------------------------------------------------------------------
let g:syntastic_html_tidy_exec      = 'tidy'
let g:syntastic_stl_format          = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_enable_perl_checker = 1
let g:syntastic_enable_signs        = 1
let g:syntastic_check_on_open       = 1
let g:syntastic_html_tidy_ignore_errors = [
    \ '<sv-',
    \ 'discarding unexpected </sv-',
    \ 'proprietary attribute "sv-"'
    \ ]
" }}}

" Plugin TagBar {{{
" -----------------------------------------------------------------------------
" let g:tagbar_usearrows = 1
" map <leader>t :TagbarToggle<CR>
" }}}

" Plugin Unite {{{
if (!exists('s:plugin_off'))
    let g:unite_source_history_yank_enable = 1

    " TODO: with current dir/buffer dir

    " Default Unite buffer, async recursive
    " nnoremap <leader><space> :Unite -no-split -start-insert file_rec/async<cr>
    nnoremap <leader><space> :Unite -no-split -start-insert file_rec<cr>
    " Git searching
    nnoremap <leader>f :Unite -no-split -start-insert file_rec/git<cr>
    " Buffer switching
    nnoremap <leader>m :Unite -quick-match buffer<cr>
    nnoremap <leader>l :Unite -no-split -start-insert file_mru<cr>
    nnoremap <leader>y :Unite history/yank<cr>
    nnoremap <leader>n :Unite -no-split file/new directory/new file directory<cr>
    nnoremap <leader>b :Unite -no-split bookmark<cr>
    nnoremap <leader>a :UniteBookmarkAdd<cr>

    call unite#custom#source('file_rec,file_rec/async,file_rec/git', 'ignore_pattern',
        \ '\.svg$\|\.ico\|\.png$\|\.jpg$\|\.tmp/\|vendor/\|node_modules/')

    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    let g:unite_source_rec_max_cache_files=3000

    call unite#custom#source('file_rec,file_rec/async', 'max_candidates', 3000)

    if executable('ag')

        let g:unite_source_rec_async_command=
                \ ['ag', '--follow', '--nocolor', '--nogroup',
                \  '--hidden', '-g', '', '--ignore', 'node_modules',
                \ '--ignore', '.git*',
                \ '-G', '\.(js|php|css|sass|json|md|txt|html|jade|scss|less|tex)$'
                \ ]

    endif

endif

" }}}

" Plugin vim-airline {{{
" -----------------------------------------------------------------------------
set laststatus=2 " Always display the statusline in all windows
"set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"let g:airline_inactive_collapse=1
"let g:airline_section_z = "%3p%% %{g:airline_symbols.linenr}%#__accent_bold#%4l%#__restore__#U"
" }}}

" Plugin vim-jedi {{{
" -----------------------------------------------------------------------------
" let g:ycm_min_num_of_chars_for_completion = 2
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
"
" Plugin bim {{{
let g:bim_remap_commentary = 1
let g:bim_remap_fugitive   = 1
let g:bim_remap_surround   = 1
" }}}

" Vim template {{{
" -----------------------------------------------------------------------------
" Try to get email and name from git
let g:email=system("echo -n `git config --list | grep user.email | head -n 1 | cut -d'=' -f2`")
let g:username=system("echo -n `git config --list | grep user.name | cut -d'=' -f2`")

" Plugin vim-template
let g:snips_author = username . "<" . email . ">"
" }}}


" vim-pandoc {{{
let g:pandoc#biblio#sources = 'b'
" }}}

" }}} plugins section

" Specific settings (keyboard, machine, OS…) {{{
" -----------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" }}}
