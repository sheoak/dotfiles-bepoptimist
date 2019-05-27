""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Loading plugin via vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ----------------------------------------------------------------------------
" Disabled plugins
" ----------------------------------------------------------------------------
" Plug 'bfredl/nvim-ipy'

" ----------------------------------------------------------------------------
" Under testing …
" ----------------------------------------------------------------------------
Plug 'chrisbra/csv.vim'
Plug 'SidOfc/mkdx'                     " Markdown goodies
Plug 'AndrewRadev/sideways.vim'

" ----------------------------------------------------------------------------
" My custom plugins
" ----------------------------------------------------------------------------
Plug 'sheoak/vim-bepoptimist'   " Bepo keymap

" ----------------------------------------------------------------------------
" Themes and styling
" ----------------------------------------------------------------------------
Plug 'iCyMind/NeoSolarized'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'junegunn/vim-emoji'
Plug 'vim-airline/vim-airline'         " Cool status bar
Plug 'vim-airline/vim-airline-themes'  " Airline themes

" ----------------------------------------------------------------------------
" Shougo plugin suite
" ----------------------------------------------------------------------------
Plug 'Shougo/denite.nvim'
if has('nvim')
    Plug 'Shougo/deoplete.nvim',
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
Plug 'pocari/vim-denite-emoji'
Plug 'kristijanhusak/deoplete-phpactor', { 'for': 'php' }
Plug 'deoplete-plugins/deoplete-zsh'
" an alternative to test:
Plug 'lvht/phpcd.vim'
Plug 'wokalski/autocomplete-flow', { 'for': 'js' }
" an alternative to test:
" Plug 'carlitux/deoplete-ternjs'

" ----------------------------------------------------------------------------
" All languages plugins
" ----------------------------------------------------------------------------
Plug 'tpope/vim-obsession'             " Actually usable session system
Plug 'tpope/vim-fugitive'              " Git integration
Plug 'tpope/vim-surround'              " Motions around words
Plug 'tpope/vim-repeat'                " Missing repeat with dot
Plug 'tpope/vim-speeddating'           " Inc/dec dates and numbers
Plug 'tpope/vim-commentary'            " Quick comment
Plug 'tpope/vim-unimpaired'            " Pairing mapping
Plug 'tpope/vim-sleuth'                " Detect tab settings
Plug 'Ron89/thesaurus_query.vim'       " Synonyms
Plug 'junegunn/fzf.vim'                " fuzzy find wrapper
Plug 'mhinz/vim-startify'              " Startup screen
Plug 'terryma/vim-multiple-cursors'    " Multi-selection (c-n)
Plug 'MattesGroeger/vim-bookmarks'     " Annotations
Plug 'ludovicchabant/vim-gutentags'    " Ctags generation
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
Plug 'sakhnik/nvim-gdb',               " A debugger that actually works
Plug 'airblade/vim-gitgutter'          " Git gutter on the left
Plug 'rbgrouleff/bclose.vim'           " Ranger plugin dependency
Plug 'francoiscabrol/ranger.vim'       " Ranger integration
Plug 'kana/vim-operator-user'          " Grammarous dep
Plug 'aperezdc/vim-template'           " Auto-template when opening new file
Plug 'honza/vim-snippets'              " Snippets for different languages
Plug 'diepm/vim-rest-console'          " Call REST API from vim
Plug 'rhysd/vim-grammarous'            " Grammar check

" ----------------------------------------------------------------------------
" Filetype specific plugins
" ----------------------------------------------------------------------------
" Python
Plug 'davidhalter/jedi-vim',         { 'for': 'python' }
Plug 'zchee/deoplete-jedi',          { 'for': 'python' }
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'numirias/semshi',              { 'for': 'python',
    \ 'do': ':UpdateRemotePlugins'} " semantic syntax

" Web
Plug 'mattn/emmet-vim',        { 'for': ['html','css', 'scss', 'sass'] }
Plug 'alvan/vim-closetag',     { 'for': ['html','css', 'scss', 'sass'] }
Plug 'jaxbot/browserlink.vim', { 'for': ['html', 'css', 'js', 'sass', 'scss'] }
Plug 'tmhedberg/matchit',      { 'for': ['html', 'xml'] }
Plug 'posva/vim-vue',          { 'for': ['js'] }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }

" PHP
Plug 'tobyS/pdv' ,                       { 'for': 'php' }
Plug 'phpactor/phpactor' ,               { 'do': 'composer install', 'for': 'php'}
Plug 'noahfrederick/vim-composer'

" Javascript
Plug 'jelera/vim-javascript-syntax', { 'for': 'js' }
Plug 'elzr/vim-json',                { 'for': 'json' }

" System
Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }

" Text files
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" After - plugins that must be loaded last
Plug 'ryanoasis/vim-devicons'          " icons, must be loaded after the rest
