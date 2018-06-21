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

" vim-plug {{{
" -----------------------------------------------------------------------------
if has('nvim')
    let s:plug_path=$HOME . '/.local/share/nvim/plugged'
else
    let s:plug_path=$HOME . '/.vim/plugged'
endif

call plug#begin(s:plug_path)

" My custom plugins
Plug 'sheoak/vim-bepoptimist'                         " Bepo keymap

" Themes
Plug 'iCyMind/NeoSolarized'

" Shougo plugin suite
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
Plug 'wokalski/autocomplete-flow'
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plug 'kristijanhusak/deoplete-phpactor'

Plug 'bling/vim-airline'        " Cool status bar
Plug 'tpope/vim-surround'       " motions around words
Plug 'tpope/vim-repeat'         " missing repeat with dot
Plug 'tpope/vim-speeddating'    " inc/dec dates and numbers
Plug 'tpope/vim-commentary'     " quick comment
Plug 'justinmk/vim-sneak'       " Multiline f/F/t/T
Plug 'wellle/targets.vim'       " Additionnal text objects like cin) or da,
Plug 'junegunn/goyo.vim'        " Minimalist interface on demand with :Goyo
Plug 'scrooloose/syntastic'     " Syntax checker for JS, PHP, Python…
Plug 'sjl/gundo.vim'            " More undo
Plug 'junegunn/vim-easy-align'  " Align tabs

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter', { 'for': 'git' } " Git gutter on the left

" Filetype specific plugins
Plug 'davidhalter/jedi',             { 'for': 'python' }
Plug 'zchee/deoplete-jedi',          { 'for': 'python' }
Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }
Plug 'digitaltoad/vim-jade',         { 'for': 'jade' }
Plug 'hail2u/vim-css3-syntax',       { 'for': 'css' }
Plug 'mattn/emmet-vim',              { 'for': ['html','css'] }
Plug 'tmhedberg/matchit',            { 'for': ['html', 'xml'] }
Plug 'tobyS/pdv' ,                   { 'for': 'php' }      " phpDocumentor
Plug 'jelera/vim-javascript-syntax', { 'for': 'js' }
Plug 'elzr/vim-json',                { 'for': 'json' }
Plug 'plasticboy/vim-markdown',      { 'for': 'markdown' }
Plug 'vim-pandoc/vim-pandoc',        { 'for': 'markdown' }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'markdown' }

" I only enable thoses when i need them
" Plug 'editorconfig/editorconfig-vim'
" Plug 'sirver/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'arnauddri/vim-lodash-snippets'
" Plug 'aperezdc/vim-template'

" Initialize plugin system
call plug#end()

" }}}

" neovim configuration {{{
let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'
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
set sessionoptions-=options     " do not save options
set viminfo^=!                  " keep some vim history after closing
set viminfo+=n~/.vim/viminfo

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
        au FileType sass,jade,html setlocal
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
        au FileType python         setlocal omnifunc=pythoncomplete#Complete
        au FileType html,markdown  setlocal omnifunc=htmlcomplete#CompleteTags
        au FileType xml            setlocal omnifunc=xmlcomplete#CompleteTags

        " formating by types
        au FileType vim            setlocal foldmethod=marker foldlevel=0
        au FileType text           setlocal tw=78 formatoptions+=tw

        au FileType markdown       setlocal tw=80 formatoptions+=taw
        au FileType gitcommit      setlocal tw=72 colorcolumn=72
                    \ formatoptions+=taw

        " Mail: remove annoying trail space detection and set gutter
        au FileType mail setlocal tw=72 listchars=tab:\ \

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

" Don't use Ex mode, use Q for formatting
noremap Q gq

" Unamed register access is rarely useful, remap it
nnoremap "" :registers<CR>

" pretty print json
nnoremap æj :%!python -m json.tool<CR>

" ranger style
nnoremap gn :tabe<CR>

" new operator pending maps

" [I]nside [N]ext (
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>

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

" }}}

" Plugins configuration {{{
" -----------------------------------------------------------------------------

" Plugin Emmet {{{
" -----------------------------------------------------------------------------
let g:user_emmet_install_global = 0
au FileType html,css,scss,sass EmmetInstall
let g:user_emmet_leader_key='<C-y>'
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

" Plugin vim-airline {{{
" -----------------------------------------------------------------------------
set laststatus=2 " Always display the statusline in all windows
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

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
let g:snips_trigger_key = '<S-tab>'
"let g:UltiSnipsExpandTrigger="<c-g><c-g>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-g><c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-g><c-p>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:pdv_template_dir = $HOME ."/.local/share/nvim/plugged/pdv/templates_snip"
nnoremap <buffer> <C-p> :call pdv#DocumentWithSnip()<CR>

" }}}
"
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
let g:sneak#use_ic_scs = 1
" }}}

" {{{ Gundo
let g:gundo_prefer_python3 = 1
" }}}

" vim-bepoptimist {{{
let g:bim_map_fugitive = 1
let g:bim_remap_leader = 1
let g:surround_no_mappings = 1
" }}}

" {{{ Deoplete
" Use deoplete.
let g:deoplete#enable_at_startup = 1
" }}}

" {{{ Denite
call denite#custom#option('default', { 'prompt': '❯' })

call denite#custom#source(
	\ 'file/rec', 'matchers', ['matcher/fuzzy', 'matcher/project_files', 'matcher/hide_hidden_files'])

call denite#custom#map(
      \ 'insert',
      \ '<C-n>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-p>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)

" Denite for git
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
    \ ['git', 'ls-files', '-co', '--exclude-standard'])
nnoremap <silent> ,g :<C-u>DeniteBufferDir
    \ `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`<CR>

" Ag command on grep source
if (executable('ag'))
    call denite#custom#var('file/rec', 'command',
        \ ['ag', '--follow', '--hidden', '--nocolor', '--nogroup', '-g', ''])

    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
endif

nnoremap <Tab> :<C-u>DeniteProjectDir file/rec<CR>
nnoremap \b :<C-u>Denite buffer<CR>
nnoremap \s :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
nnoremap \S :<C-u>DeniteProjectDir grep:. -mode=normal<CR>
nnoremap \f :<C-u>DeniteBufferDir file_rec<CR>
nnoremap \r :<C-u>Denite register<CR>
nnoremap \m :<C-u>Denite menu:bookmarks<CR>
" history
nnoremap \h :<C-u>Denite file_mru<CR>
nnoremap \d :<C-u>Denite directory_mru<CR>
nnoremap \c :<C-u>Denite command_history<CR>

" Add custom menus
" TODO: a bookmark plugin for denite would be better
let s:menus = {}

let s:menus.bookmarks = {
    \ 'description': 'Bookmarks'
\ }
let s:menus.bookmarks.file_candidates = [
    \ ['init.vim'          , '~/.config/nvim/init.vim']                                                  ,
    \ ['bepoptimist'       , '~/.local/share/nvim/plugged/vim-bepoptimist/plugin/bepoptimist.vim']       ,
    \ ['bepoptimist after' , '~/.local/share/nvim/plugged/vim-bepoptimist/after/plugin/bepoptimist.vim'],
    \ ['mkinitpcio',    '/etc/mkinitcpio.conf'],
    \ ['grub',          '/etc/default/grub'],
    \ ['fstab',         '/etc/fstabc'],
    \ ['zshrc',  '~/.zshrc'],
    \ ['zshenv', '~/.zshenv'],
    \ ['custom zsh', '~/.oh-my-zsh/custom/plugins/common-aliases/common-aliases.plugin.zsh'],
    \ ['i3', '~/.config/i3/config'],
    \ ['i3 status', '~/.config/i3/i3status.conf'],
    \ ['qutebrowser', '~/.config/qutebrowser/config.py'],
    \ ['kitty', '~/.config/kitty/kitty.conf'],
    \ ['mutt', '~/.muttrc']
\ ]

call denite#custom#var('menu', 'menus', s:menus)

" }}}

" goyo {{{
let g:goyo_height='90%'
let g:goyo_width=80
let g:goyo_linenr=1
" }}}

" }}} plugins section

