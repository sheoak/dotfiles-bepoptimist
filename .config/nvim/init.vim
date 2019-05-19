" Vim main configuration file {{{
"
" Maintainer: sheoak
" Version:    O.2
"
" I use this config mainly for:
"
" - Programming under git versionning (PHP/JS/HTML/CSS/Python/Bash)
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
" Dependencies:
" -----------------------------------------------------------------------------
"
" - vim-plug:   https://github.com/junegunn/vim-plug
" - git:        for vim-fugitive plugin (optionnal)
" - jshint:     for syntastic — npm install -g jshint (optionnal)
"
" Installation:
" -----------------------------------------------------------------------------
"
" copy this file to ~/.vimrc for vim or ~/.local/nvim/init.vim for neovim
" manually install vim-plug as instructed
" I don't maintain vim version anymore so you will have to modify some code
" to make it work.
"
" Tip: Setting your keyboard key repeat and speed high will give you a better
" experince in vim!
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}

" Plugins (vim-plug) {{{
" -----------------------------------------------------------------------------
if has('nvim')
    let s:plug_path=$HOME . '/.local/share/nvim/plugged'
else
    let s:plug_path=$HOME . '/.vim/plugged'
endif

call plug#begin(s:plug_path)

" My custom plugins {{{
"
" TODO: split it
" TODO: add more options
" TODO: update documentation
" ----------------------------------------------------------------------------
Plug 'sheoak/vim-bepoptimist'   " Bepo keymap
" }}}

" Themes {{{
" ----------------------------------------------------------------------------
Plug 'iCyMind/NeoSolarized'
Plug 'morhetz/gruvbox'
Plug 'flazz/vim-colorschemes'
" }}}

" Shougo plugin suite {{{
" ----------------------------------------------------------------------------
Plug 'Shougo/denite.nvim'       " Unite interfaces
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

" Deoplete deps/addons
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Extra sources
Plug 'kmnk/denite-dirmark'
Plug 'junegunn/vim-emoji'
Plug 'pocari/vim-denite-emoji'

" For vim-vebugger
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" }}}

" All languages plugins {{{
" ----------------------------------------------------------------------------
Plug 'scrooloose/nerdtree'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ludovicchabant/vim-gutentags'    " Ctags generation
Plug 'vim-airline/vim-airline'         " Cool status bar
Plug 'vim-airline/vim-airline-themes'  " Airline themes
Plug 'tpope/vim-surround'              " Motions around words
Plug 'tpope/vim-repeat'                " Missing repeat with dot
Plug 'tpope/vim-speeddating'           " Inc/dec dates and numbers
Plug 'tpope/vim-commentary'            " Quick comment
Plug 'tpope/vim-unimpaired'            " Pairing mapping
Plug 'justinmk/vim-sneak'              " Multiline f/F/t/T
Plug 'wellle/targets.vim'              " Additionnal text objects: cin) or da,…
Plug 'bkad/CamelCaseMotion'            " Additionnal CamelCase motions
Plug 'michaeljsmith/vim-indent-object' " Indentation text objects
Plug 'jeetsukumaran/vim-indentwise'    " Motion for indentations
Plug 'jeetsukumaran/vim-pythonsense'   " Additionnal python text-objects
Plug 'PeterRincker/vim-argumentative'  " Switch arguments
Plug 'junegunn/goyo.vim'               " Minimalist interface on demand
Plug 'dmerejkowsky/vim-ale'            " Async Linter
Plug 'sjl/gundo.vim'                   " More undo
Plug 'junegunn/vim-easy-align'         " Align tabs
Plug 'dhruvasagar/vim-table-mode'      " Make table easily
Plug 'editorconfig/editorconfig-vim'   " Read editorconfig file
Plug 'airblade/vim-rooter'             " Auto cd to project dir
Plug 'fboender/bexec'                  " Execute current script
Plug 'vim-vdebug/vdebug'               " Interactive debugger
Plug 'tpope/vim-fugitive'              " Git integration
Plug 'airblade/vim-gitgutter'          " Git gutter on the left
Plug 'rbgrouleff/bclose.vim'           " Ranger plugin dependency
Plug 'francoiscabrol/ranger.vim'       " Ranger integration
Plug 'kana/vim-operator-user'          " Grammarous dep
Plug 'rhysd/vim-grammarous'            " Grammar check
Plug 'aperezdc/vim-template'           " Auto-template when opening new file
Plug 'honza/vim-snippets'              " Snippets for different languages
Plug 'diepm/vim-rest-console'          " Call REST API from vim
Plug 'idanarye/vim-vebugger'
" }}}

" Filetype specific plugins {{{
" ----------------------------------------------------------------------------

" Python
Plug 'davidhalter/jedi',             { 'for': 'python' }
Plug 'zchee/deoplete-jedi',          { 'for': 'python' }
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }
Plug 'hail2u/vim-css3-syntax',       { 'for': 'css' }
Plug 'plytophogy/vim-virtualenv'
Plug 'broesler/jupyter-vim'  " TODO: test me
Plug 'szymonmaszke/vimpyter' " TODO: test me

" Web
Plug 'mattn/emmet-vim',        { 'for': ['html','css', 'scss', 'sass'] }
Plug 'alvan/vim-closetag',     { 'for': ['html','css', 'scss', 'sass'] }
Plug 'jaxbot/browserlink.vim', { 'for': ['html', 'css', 'js', 'sass', 'scss'] }
Plug 'tmhedberg/matchit',      { 'for': ['html', 'xml'] }
Plug 'posva/vim-vue',          { 'for': ['js'] }
Plug 'ap/vim-css-color'

" PHP
Plug 'tobyS/pdv' ,                       { 'for': 'php' }
Plug 'phpactor/phpactor' ,               { 'do': 'composer install', 'for': 'php'}
Plug 'kristijanhusak/deoplete-phpactor', { 'for': 'php' }

" Javascript
Plug 'jelera/vim-javascript-syntax', { 'for': 'js' }
Plug 'wokalski/autocomplete-flow',   { 'for': 'js' }
Plug 'elzr/vim-json',                { 'for': 'json' }

" Text files
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" }}}

" Special plugins {{{
Plug 'ryanoasis/vim-devicons'  " icons, must be loaded after the rest
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" }}}

" Initialize plugin system
call plug#end()

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

" History / undo {{{
" -----------------------------------------------------------------------------
set history=500                " keep 500 lines of command line history
set backup
set swapfile
" you need to create backups and undo directory
" XDG_DATA_HOME may not be defined so we use home
set backupdir=$HOME/.local/share/nvim/backups,$HOME/.backups/,/tmp/
" the last // will add the absolute path to the file
set directory=$HOME/.local/share/nvim/swap//,$HOME/.backups//,/tmp//
set writebackup
set backupskip=/tmp/*,$HOME/backups/*,*.tmp/*,*.cache/*
set sessionoptions-=options     " do not save options
set viminfo^=!                  " keep some vim history after closing
set viminfo+=n~/.vim/viminfo

" Persistent Undo
" Keep undo history across sessions, by storing in file.
if has('persistent_undo')
    set undodir=$HOME/.local/share/nvim/undo//,$HOME/.backups/undo//,/tmp/undo//
    set undofile
endif
" }}}

" Editing {{{
" -----------------------------------------------------------------------------
set complete-=i                      " scan current and included files
set ttimeout
set ttimeoutlen=100                  " time waited before end of sequence
set autoread                         " detect file changed outside of vim
set tabstop=4                        " number of visual spaces per TAB
set softtabstop=4                    " number of spaces in tab when editing
set shiftwidth=4
set expandtab                        " tabs are spaces
set listchars=nbsp:·,trail:¤,tab:\ \ " show invisible nbsp/tabs spaces
set list
set backspace=indent,eol,start       " allow all backspacing in insert mode
set showmatch                        " briefly jump to matching bracket
set nojoinspaces                     " only one space when joining lines
set nrformats-=octal                 " numbers with leading zeros are not octal
set diffopt+=vertical                " start diff mode with vert. splits

 " yank to the system clipboard by default
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
elseif has('clipboard')
    set clipboard=unnamed
endif

" do not use insert comment on new line with o command
set formatoptions=crqln

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
set guifont=Hack\ Nerd\ Font\ Mono\ 12
set nonumber            " show line number ?
set norelativenumber    " show relative number also ?

" Disabled due to a bug (freeze) with matching pairs
set nocursorline        " highlight current line
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
set wildignore+=*.woff,*.woff2,*.ttf,*.eot
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

if $TERM == 'linux'
    colorscheme NeoSolarized
else
    try
        colorscheme NeoSolarized
    catch
        colorscheme desert
    endtry
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
        au FileType sass,pug,html,yaml setlocal
            \ softtabstop=2
            \ shiftwidth=2
            \ tabstop=2

        " HTML/CSS mapping
        au FileType html,css,sass,less
            \ imap <buffer> <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

        " omnifunc by types
        au FileType php            setlocal omnifunc=phpcomplete#CompletePHP
        au FileType css,sass,less  setlocal omnifunc=csscomplete#CompleteCSS
        au FileType javascript     setlocal omnifunc=javascriptcomplete#CompleteJS
        au FileType javascript     setlocal formatprg=prettier\ --stdin
        au FileType python         setlocal omnifunc=pythoncomplete#Complete
        au FileType html,markdown  setlocal omnifunc=htmlcomplete#CompleteTags
        au FileType xml            setlocal omnifunc=xmlcomplete#CompleteTags

        " formating by types
        au FileType vim            setlocal foldmethod=marker foldlevel=0
        au FileType text           setlocal tw=78 formatoptions+=tw

        au FileType markdown       setlocal tw=80 formatoptions+=tw
        au FileType gitcommit      setlocal tw=72 colorcolumn=72
                    \ formatoptions+=taw

        " Mail: remove annoying trail space detection and set gutter
        " fo+=aw is for mutt text_flowed option
        au FileType mail setlocal tw=72 fo+=aw listchars=tab:\ \ 
        au FileType java setlocal omnifunc=javacomplete#Complete

    augroup END
    " }}}

    " Special settings for passwords files {{{
    augroup fileDetectPassword
        au BufEnter /dev/shm/*    setlocal nobackup noswapfile noundofile
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

" Custom maps {{{

" note that \ is not leader in this configuration (, is)
" and , has been moved to ç, taking advantage of bepo (see bepoptimist plugin)

" default leader is bad in azerty and bépo keyboards
" bepoptimist plugin will take care of moving , and ; to ç and Ç
" it's better to set the leader here than in plugins to avoid issues
let mapleader = ","

" TODO: affect some map to ",,"
" Quick save with new leader
" noremap <leader>, :w<CR>

" Don't use Ex mode, use Q for formatting
noremap Q gq

" TODO: move to a better place
" [O]rder all css properties
nnoremap <leader>o :<C-u>g/{/ .+1,/}/-1 sort<CR>

" Rewrite some vim maps in insert mode, not that usefull anyway:
inoremap <C-j> <C-x><C-]>
inoremap <C-f> <C-x><C-f>
inoremap <C-l> <C-x><C-l>
inoremap <C-o> <C-x><C-o>

nnoremap gF :e <cfile><CR>

" don't override register when pasting over
xnoremap p pgvy

" page up/down
noremap <BS> <PageUp>
noremap <Space> <PageDown>

" terminal escape instead of C-\ C-n
tnoremap <C-g> <C-\><C-n>

" delete in black hole (do not store in register
" (ð is altGr+d)
nnoremap ð "_d

" }}}

" Plugins configuration {{{
" -----------------------------------------------------------------------------
let loaded_matchparen = 1

" Neovim {{{
let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'
" }}}

" Plugin Emmet {{{
" -----------------------------------------------------------------------------
let g:user_emmet_install_global = 0
au FileType html,css,scss,sass EmmetInstall
let g:user_emmet_leader_key='<C-y>'
"imap <C-g>g <C-g>,
" }}}

" Plugin ALE {{{
" Fix files with prettier, and then ESLint.
let g:ale_fixers = ['prettier', 'stylelint', 'eslint', 'autopep8', 'yapf',
            \   'remove_trailing_lines', 'trim_whitespace' ]
" Check Python files with flake8 and pylint.
" let b:ale_linters = ['flake8', 'pylint']
" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 0
nnoremap <silent> ]oa :ALEDisable<cr>
nnoremap <silent> [oa :ALEEnable<cr>
nnoremap <silent> yoa :ALEToggle<cr>
nnoremap <silent> ylf :ALEFix<cr>
nnoremap <silent> yld :ALEDetail<cr>
nnoremap <silent> [h :ALEPrevious<cr>
nnoremap <silent> ]h :ALENext<cr>
" }}}

" Plugin vim-rooter {{{
" how to identify a project root
let g:rooter_patterns = ['Rakefile', '.git/', '.ctags', 'package.json']
" }}}
"
" Plugin vim-airline {{{
" -----------------------------------------------------------------------------
set laststatus=2 " Always display the statusline in all windows
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline_theme='solarized'
let g:airline_theme='gruvbox'
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

" Sneak {{{
let g:sneak#label = 0
let g:sneak#use_ic_scs = 1
" }}}

" {{{ Gundo
let g:gundo_prefer_python3 = 1
" }}}

" Bepoptimist {{{
let g:bim_map_fugitive     = 1
" switch : and .
" doesn't work: vim-repeat ends up remapping it sometimes
" let g:bim_switch_command   = 1
" nmap : <Plug>(RepeatDot)
" we need to tell surround that Bepoptimist is going to map it
" and this need to happens in init.vim before surround is loaded
let g:surround_no_mappings = 1
" }}}

" {{{ Deoplete
" Use deoplete.
let g:python_host_prog=expand('~/.virtualenvs/neovim2/bin/python')
let g:python3_host_prog=expand('~/.virtualenvs/neovim3/bin/python')
let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1 

let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
let g:deoplete#sources = {}
let g:deoplete#sources._ = []
let g:deoplete#file#enable_buffer_path = 1
" }}}

" {{{ Denite

" TODO: check that denite is loaded (lazy loading). How?

" temporory fix for devicons (deprecated sources):
call denite#custom#source('file,file/rec,file/mru,file/old,file/point',
    \ 'converters', ['devicons_denite_converter'])

call denite#custom#option('default', { 'prompt': '❯' })

call denite#custom#source('file', 'matchers', [
        \ 'matcher/hide_hidden_files',
        \ 'matcher/fuzzy',
        \ 'matcher/project_files',
    \])
call denite#custom#source('file/rec', 'matchers', [
        \ 'matcher/hide_hidden_files',
        \ 'matcher/fuzzy',
        \ 'matcher/project_files'
    \])
call denite#custom#source('directory_rec', 'matchers', [
        \ 'matcher/hide_hidden_files',
        \ 'matcher/fuzzy',
        \ 'matcher/project_files'
    \])

call denite#custom#source('file/rec', 'sorters', [ 'sorter/rank' ])
call denite#custom#source('directory_rec', 'sorters', [ 'sorter/rank' ])
call denite#custom#source('file_mru', 'sorters', [ 'sorter/sublime' ])

call denite#custom#source( 'grep', 'matchers', [
        \ 'matcher_regexp'
     \])

" Denite for git
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
    \ ['git', 'ls-files', '-co', '--exclude-standard'])

" call denite#custom#alias('source', 'directory/rec/git', 'directory_rec')
" call denite#custom#var('directory/rec/git', 'command',
"     \ ['git', 'ls-remote', '-co', '--exclude-standard'])

call denite#custom#alias('source', 'file/rec/gitremote', 'file/rec')
call denite#custom#var('file/rec/gitremote', 'command',
    \ ['git', 'ls-remote', '-co', '--exclude-standard'])

call denite#custom#map(
      \ 'insert',
      \ '<C-n>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'insert',
      \ '<C-t>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'insert',
      \ '<C-j>',
      \ '<denite:do_action:tabopen>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'insert',
      \ '<C-space>',
      \ '<denite:toggle_select>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'insert',
      \ '<C-g>',
      \ '<denite:enter_mode:normal>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'insert',
      \ '<C-r>',
      \ '<denite:jump_to_previous_source>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'insert',
      \ '<C-s>',
      \ '<denite:jump_to_next_source>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'insert',
      \ '<C-h>',
      \ '<denite:restore_sources>',
      \ 'noremap'
      \)

" Ag command on grep source
if (executable('ag'))
    call denite#custom#var('file/rec', 'command',
        \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])

    " Denite with hidden files
    call denite#custom#alias('source', 'file/rec/hidden', 'file/rec')
    call denite#custom#var('file/rec/hidden', 'command',
        \ ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', ''])

endif

" Denite-like mappings
nmap <leader>s :w<CR>
nmap <leader>S :w!<CR>
nmap <leader>w :s 
nmap <leader>W :s! 
nmap <leader>q :q<CR>
nmap <leader>Q :q!<CR>
nmap <leader>x :x<CR>
nmap <leader>X :x!<CR>
nmap <leader>d :bdelete<CR>
nmap <leader>D :bdelete!<CR>

" -----------------------------------------------------------------------------
" Memo:
" -----------------------------------------------------------------------------
" .         hidden hiles are included
" c         current file directory
" h         home directory
" lower     files
" upper     directories
" -----------------------------------------------------------------------------

" Recent and favorites
nnoremap <Tab> :<C-u>Denite buffer<CR>
nnoremap <leader>, :<C-u>Denite -resume<CR>
nnoremap <leader>m :<C-u>Denite dirmark<CR>
nnoremap <leader>M :<C-u>Denite dirmark/add<CR>
nnoremap <leader><space> :<C-u>Denite -source-names=hide file_mru directory_mru dirmark<CR>

" [R]ecent
nnoremap <leader>r :<C-u>Denite file_mru<CR>
nnoremap <leader>R :<C-u>Denite directory_mru<CR>

" [f]ile
nnoremap <leader>f :<C-u>DeniteProjectDir file/rec<CR>
nnoremap <leader>.f :<C-u>DeniteProjectDir file/rec/hidden<CR>
nnoremap <leader>cf :<C-u>DeniteBufferDir file/rec<CR>
nnoremap <leader>.cf :<C-u>DeniteBufferDir file/rec/hidden<CR>
nnoremap <leader>hf :<C-u>Denite -path=~ file/rec<CR>
nnoremap <leader>.hf :<C-u>Denite -path=~ file/rec/hidden<CR>

" [F]older
nnoremap <leader>F :<C-u>DeniteProjectDir directory_rec<CR>
nnoremap <leader>.F :<C-u>DeniteProjectDir directory/rec/hidden<CR>
nnoremap <leader>cF :<C-u>DeniteBufferDir directory_rec<CR>
nnoremap <leader>.cF :<C-u>DeniteBufferDir directory/rec/hidden<CR>
nnoremap <leader>hF :<C-u>Denite -path=~ directory_rec<CR>
nnoremap <leader>.hF :<C-u>Denite -path=~ directory/rec/hidden<CR>

" [b]rowse (file/directory non recursive)
nnoremap <leader>b :<C-u>DeniteProjectDir file<CR>
nnoremap <leader>cb :<C-u>DeniteBufferDir file<CR>
nnoremap <leader>hb :<C-u>Denite -path=~ file<CR>

" [G]it
" TODO: bare repo config?
nnoremap <leader>g :<C-u>DeniteProjectDir
    \ `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`<CR>
" nnoremap <leader>G :<C-u>DeniteProjectDir
"     \ `finddir('.git', ';') != '' ? 'directory/rec/git' : 'directory/rec'`<CR>
nnoremap <leader>cg :<C-u>DeniteBufferDir
    \ `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`<CR>
" nnoremap <leader>cG :<C-u>DeniteBufferDir
"     \ `finddir('.git', ';') != '' ? 'directory/rec/git' : 'directory/rec'`<CR>

" Searching
nnoremap <leader># :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
nnoremap <leader>/ :<C-u>DeniteProjectDir grep:. -mode=normal<CR>
map <leader>a :DeniteProjectDir -buffer-name=grep -default-action=quickfix grep:::!<CR>
map <leader>ca :DeniteBufferDir -buffer-name=grep -default-action=quickfix grep:::!<CR>
map <leader>ha :Denite -path=~ -buffer-name=grep -default-action=quickfix grep:::!<CR>

" Ranger
nnoremap ,e :RangerWorkingDirectory<CR>
nnoremap ,ce :RangerCurrentFile<CR>
nnoremap ,he :Ranger ~<CR>

" Others
nnoremap <leader>à :<C-u>Denite jump<CR>
nnoremap <leader>C :<C-u>Denite colorscheme<CR>
nnoremap <leader>E :<C-u>Denite emoji<CR>
nnoremap <leader>k :<C-u>Denite help<CR>
nnoremap <leader>l :<C-u>Denite line<CR>
nnoremap <leader>n :<C-u>NERDTreeToggle<CR>
nnoremap <leader>t :<C-u>Denite tag<CR>
nnoremap <leader>u :<C-u>:Gundo<CR>
nnoremap <leader>y :<C-u>Denite register<CR>
nnoremap <leader>Z :<C-u>Denite grammarous<CR>
nnoremap <leader>z :<C-u>Denite spell<CR>
nnoremap <leader>: :<C-u>Denite command<CR>
nnoremap <leader>… :<C-u>Denite command_history<CR>
nnoremap <leader>! :Denite output:!
nnoremap <leader>? :map <leader><CR>
" }}}

" Goyo {{{
" TODO: create unimpaired mappings
let g:goyo_height='90%'
let g:goyo_width=80
let g:goyo_linenr=1
" }}}

" Ranger {{{
let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory
" }}}

" Neosnippets {{{
" Plugin key-mappings.
" Note: It must be "imap" and "smap"
imap <C-space>     <Plug>(neosnippet_expand_or_jump)
smap <C-space>     <Plug>(neosnippet_expand_or_jump)
xmap <C-space>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap"
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.local/share/nvim/plugged/vim-snippets/snippet'

let g:neosnippet#scope_aliases = {}
let g:neosnippet#scope_aliases['python'] = 'python,django'
" }}}

" EasyAlign {{{
" Defined in bepoptimist
" }}}

" Gutentag {{{
let g:gutentags_ctags_tagfile=".ctags"
" }}}

" Vimpyter {{{
" TODO: move to unimpaired ]o [o
autocmd Filetype ipynb nnoremap <silent>yvi :VimpyterInsertPythonBlock<CR>
autocmd Filetype ipynb nnoremap <silent>yvs :VimpyterStartJupyter<CR>
autocmd Filetype ipynb nnoremap <silent>yvn :VimpyterStartNteract<CR>
" }}}

" vim-markdown {{{
let g:mkdp_browser = 'qutebrowser'

nmap [om <Plug>MarkdownPreview
nmap ]om <Plug>MarkdownPreviewStop
nmap yom <Plug>MarkdownPreviewToggle
" }}}

" Git-gutter {{{
set updatetime=100

nmap ]og :GitGutterLineHighlightsDisable<CR>
nmap [og :GitGutterLineHighlightsEnable<CR>
nmap yog :GitGutterLineHighlightsToggle<CR>
nmap gya <Plug>GitGutterStageHunk
nmap gyu <Plug>GitGutterUndoHunk
nmap gyz <Plug>GitGutterPreviewHunk
" }}}

" Table-mode {{{
" TODO: remove tm mapping
nnoremap ]ot :TableModeEnable<CR>
nnoremap [ot :TableModeDisable<CR>
nnoremap yot :TableModeToggle<CR>

" Memo: þ is AltGr+T ([T]able)
nnoremap þþ :TableModeToggle<CR>
nnoremap þs :TableModeSort<CR>
nnoremap þf :TableModeAddFormula<CR>
nnoremap þe :TableModeEvalFormulaLine<CR>

nnoremap þt <Plug>(table-mode-tableize)
xnoremap þt <Plug>(table-mode-tableize)
xnoremap þd <Plug>(table-mode-tableize-delimiter)
" }}}

" Grammarous {{{
let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'markdown' : 0, 'text' : 0
            \ }
let g:grammarous#use_vim_spelllang = 1

" Memo: ß is AltGr+S ([S]pell)
nmap ßß <Plug>(grammarous-fixit)
nmap ßI <Plug>(grammarous-move-to-info-window)
nmap ßi <Plug>(grammarous-open-info-window)
nmap ßh <Plug>(grammarous-reset)
nmap ßa <Plug>(grammarous-fixall)
nmap ßq <Plug>(grammarous-close-info-window)
nmap ßr <Plug>(grammarous-remove-error)
nmap ßd <Plug>(grammarous-disable-rule)
nmap ßn <Plug>(grammarous-move-to-next-error)
nmap ßp <Plug>(grammarous-move-to-previous-error)

nmap ßc :GrammarousCheck<CR>
vmap ß :GrammarousCheck<CR>

nmap ßf :set spelllang=fr<CR>
nmap ße :set spelllang=en<CR>

nmap ßs z=

" insert modline at EOF
nmap ßmf Govim: set spelllang=fr<Esc>:Commentary<Esc><C-o>
nmap ßme Govim: set spelllang=en<Esc>:Commentary<Esc><C-o>

omap ß <Plug>(operator-grammarous)
" }}}

" CamelCase motions {{{
" motions
nmap <silent> ç <Plug>CamelCaseMotion_w
nmap <silent> Ç <Plug>CamelCaseMotion_b
nmap <silent> gç <Plug>CamelCaseMotion_e
nmap <silent> gÇ <Plug>CamelCaseMotion_ge
vmap <silent> ç <Plug>CamelCaseMotion_w
vmap <silent> Ç <Plug>CamelCaseMotion_b
vmap <silent> gç <Plug>CamelCaseMotion_e
vmap <silent> gÇ <Plug>CamelCaseMotion_ge

" text-objects {{{
omap <silent> aç <Plug>CamelCaseMotion_iw
xmap <silent> aç <Plug>CamelCaseMotion_iw
omap <silent> iç <Plug>CamelCaseMotion_ib
xmap <silent> iç <Plug>CamelCaseMotion_ib
" }}}

" vim-arguments {{{
nmap g« <Plug>Argumentative_MoveLeft
nmap g» <Plug>Argumentative_MoveRight
" }}}

" vim-indentwise {{{
" map [- <Plug>(IndentWisePreviousLesserIndent)
" map [= <Plug>(IndentWisePreviousEqualIndent)
" map [> <Plug>(IndentWisePreviousGreaterIndent)
" map ]- <Plug>(IndentWiseNextLesserIndent)
" map ]= <Plug>(IndentWiseNextEqualIndent)
" map ]+ <Plug>(IndentWiseNextGreaterIndent)
" map [_ <Plug>(IndentWisePreviousAbsoluteIndent)
" map ]_ <Plug>(IndentWiseNextAbsoluteIndent)
" map [% <Plug>(IndentWiseBlockScopeBoundaryBegin)
" map ]% <Plug>(IndentWiseBlockScopeBoundaryEnd)
" }}}

" }}} plugins section

" Devicons {{{
let g:webdevicons_enable_denite = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
" }}}

" Sneak {{{
let g:sneak#s_next = 1
let g:sneak#use_ic_scs = 1
" let g:sneak#label = 1
let g:sneak#target_labels = "auiectsrnpld"
let g:sneak#prompt = '❯'
autocmd ColorScheme * hi! link Sneak Normal
autocmd ColorScheme * hi SneakLabel guifg=white guibg=magenta ctermfg=white ctermbg=magenta
" }}}
