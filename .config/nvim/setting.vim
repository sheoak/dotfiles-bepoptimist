""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic settings for vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" -----------------------------------------------------------------------------
" Shame on me:
" Dirty hacks or unclean settings that need to be change
" -----------------------------------------------------------------------------
" issue with nvidia graphic card and optimus, need more testing:
" let loaded_matchparen = 1

" -----------------------------------------------------------------------------
" Basic vim settings
" -----------------------------------------------------------------------------

" default leader is bad in azerty and bépo keyboards
" vim-bepoptimist plugin will take care of moving , and ; to < >
" it's better to set the leader here than in plugins to avoid issues
let mapleader = ","

set hidden                     " no alert if current buffer has not been saved
set modeline                   " enable modelines comments
set modelines=1
set tags=.ctags                " search for tags file where vim is open
set fileformat=unix            " unix format by default, of course
set visualbell                 " no sounds
set noerrorbells
set shell=zsh                  " shell zsh by default

" -----------------------------------------------------------------------------
" History / undo
" -----------------------------------------------------------------------------

" you need to create backups and undo directory
" XDG_DATA_HOME may not be defined so we use home
" the last // will add the absolute path to the file
set backupdir=$HOME/.local/share/nvim/backups,$HOME/.backups/,/tmp/
set directory=$HOME/.local/share/nvim/swap//,$HOME/.backups//,/tmp//
set backupskip=/tmp/*,$HOME/backups/*,*.tmp/*,*.cache/*

set history=500                " keep 500 lines of command line history
set backup
set swapfile
set writebackup                 " backup before overwritting a file
set sessionoptions-=options     " do not save options
" set viminfo^=!                  " keep some vim history after closing
" set viminfo+=n~/.vim/viminfo

" Persistent Undo
" Keep undo history across sessions, by storing in file.
if has('persistent_undo')
    set undodir=$HOME/.local/share/nvim/undo//,$HOME/.backups/undo//,/tmp/undo//
    set undofile
endif

" -----------------------------------------------------------------------------
" Editing
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

" -----------------------------------------------------------------------------
" Searching
" -----------------------------------------------------------------------------
set incsearch           " search as characters are entered
set nohlsearch          " highlight matches off
set ignorecase
set smartcase
"set gdefault            " Add the g flag to search/replace by default

" -----------------------------------------------------------------------------
" Folding
" -----------------------------------------------------------------------------
set foldenable          " enable folding
" set nofoldenable      " dont fold by default
set foldlevelstart=50   " open most folds by default
set foldnestmax=2       " 2 nested fold max
set foldmethod=manual   " manual folding only
set foldopen+=search    " open fold when searching

" -----------------------------------------------------------------------------
" UI
" -----------------------------------------------------------------------------
set guifont=Hack\ Nerd\ Font\ Mono\ 12
set nonumber            " show line number ?
set norelativenumber    " show relative number also ?
set cursorline          " highlight current line
set colorcolumn=80
set showcmd             " display incomplete commands
set showmode            " already in airline?
set lazyredraw          " redraw only when we need to
set ttyfast             " indicates a fast terminal connection, faster redraw
set showmatch           " highlight matching 
set ruler               " show the cursor position all the time
set scrolloff=6         " nb of screen lines to keep above and below the cursor.
set sidescrolloff=5
set guioptions=a
set mouse=a             " enable mouse support
set helpheight=100      " Set window height when opening Vim help windows
set confirm             " Ask to save buffer instead of failing
set nowrap              " Don't wrap lines
set linebreak           " Wrap lines at convenient points
set display+=lastline   " Show as much as possible of long line (no @)
set previewheight=20    " preview window height
set termguicolors
set splitbelow          " new vertical splits are open below
set splitright          " new horizontal splits are open on the right
set wildignore+=*.o,*.obj,.git,*.jpg,*.png,*.gif,*.pdf,*.doc,*.swp,*.swf,*.bak
set wildignore+=*.zip,*.tar,*.gz,*.ico,*.ttf,*.eot,*/tmp/*,*/node_modules/*
set wildignore+=*.exe,*.mov,*.msi,*.xls,.ctags,*vim/backups*,*sass_cache*
set wildignore+=*.woff,*.woff2,*.ttf,*.eot
set wildignore+=*DS_Store*
set wildmenu            " Better command-line completion
"set sidescroll=1

" Add guard around 'wildignorecase' to prevent terminal vim error
if exists('&wildignorecase')
    set wildignorecase
endif

" -----------------------------------------------------------------------------
" Theme settings
" -----------------------------------------------------------------------------
if has("gui_running")
    set background=light
    set guifont="Fira Code 12"
else
    set background=dark
endif

if $TERM == 'linux'
    colorscheme Tomorrow-Night-Eighties
else
    try
        colorscheme Tomorrow-Night-Eighties
    catch
        colorscheme desert
    endtry
endif

if has("syntax")
    syntax on
endif

