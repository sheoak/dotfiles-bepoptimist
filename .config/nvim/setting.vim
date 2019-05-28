""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Extended settings for vim
"
" This configuration only contains personnal settings like custom paths,
" themes, fonts…
"
" see plugin vim-sheoak-base-settings for base settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Shame on me:
" Dirty hacks or unclean settings that need to be change
" -----------------------------------------------------------------------------
" issue with nvidia graphic card and optimus, need more testing:
" let loaded_matchparen = 1

" default leader is bad in azerty and bépo keyboards
" vim-bepoptimist plugin will take care of moving , and ; to < >
" it's better to set the leader here than in plugins to avoid issues
let mapleader = ","

" -----------------------------------------------------------------------------
" History / undo
" -----------------------------------------------------------------------------

" you need to create backups and undo directory
" XDG_DATA_HOME may not be defined so we use home
" the last // will add the absolute path to the file
set backupdir=$HOME/.local/share/nvim/backups,$HOME/.backups/,/tmp/
set directory=$HOME/.local/share/nvim/swap//,$HOME/.backups//,/tmp//
set backupskip=/tmp/*,$HOME/backups/*,*.tmp/*,*.cache/*

" Persistent Undo
" Keep undo history across sessions, by storing in file.
if has('persistent_undo')
    set undodir=$HOME/.local/share/nvim/undo//,$HOME/.backups/undo//,/tmp/undo//
endif

" -----------------------------------------------------------------------------
" UI
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
