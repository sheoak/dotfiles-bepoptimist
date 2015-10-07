TODO:

- Spell scheme
- Window scheme
    -> move
    -> create up down left right
    -> close
    -> size
- Tab ?
- Buffer scheme
- Register theme

    nnoremap à "
    nnoremap àà :registers<CR>


Plugins:

- TypeMatrix (with toggle key)
- Bepo mode (with toggle key)
- Cleaning plugin : white space, retab ?
- Advanced mappings scheme
- Mac version


Settings: (.vim/vimrc/)

- themes.vimrc
- plugins.vimrc
- settings.vimrc
- filetype.vimrc
- autocmd.vimrc
- spell.vimrc


    nnoremap ,<Backspace>  :call append(line('.')-1, '')<CR>
    nnoremap ,<Enter>      :call append(line('.'), '')<CR>
    nnoremap d<Backspace>  sddt
    nnoremap d<Enter>      tdds

    nnoremap dq :q<CR>          " close window
    nnoremap dQ :q!<CR>         " force close window
    nnoremap dk :bd<CR>         " close buffer
    nnoremap dK :bufdo :bd<CR>  " close all buffers


    " move " to à
    nnoremap àà :registers<CR>
    nnoremap à "
    " nnoremap " ?


    nmap <Tab>      " buffer toggle :b#
                    " file explorer ?
    nmap <C-Tab>    " buffer next
    nmap <S-Tab>    " buffer previous

    " bepo
    " remap è to $
    nnoremap è $
    " nnoremap $ ?
    " nnoremap _ ?
    " nnoremap —
    " nnoremap æ
    " nnoremap œ
    " nnoremap €


- buffers and windows
                    save                        ,,
                    force save                  ,w
                    sudo save                   ,W
                    toggle with last buffer


Vimrc (read, reload)
Options toggle
Reformat file   (space, tabs, tabular =:,)
Git (mode)
Unite (git, file, add, yank)
Spell

nmap yr :registers<CR> " Yanked Registers
" nmap yh :registers<CR> " Yank HiStory Unite ?

" French specific ?
" Spell on/off, fix, next… ?
" Only on typematrix -> optional key

- \`
œ
æ
" only on azerty
à + _
ç + _

z + _ _
g + _ _
d + _ _
l + _ _
y + _ _

dà
d,
du
dl
dy
dx
d.
dq
d'

gà
gy
gk
gm


ç…
’
°

page up/down ?

+ typematrix

edit (esc ?)
œ
æ
¨
 
…


groups:

- spell             on                          lon
                    off                         lof
                    fr                          lfr
                    en                          len
                    suggestion                  ?
                    add to dict                 ?
                    next error                  ?

- unite             file                        ,<space>
                    git                         ,g
                    buffers                     ,m
                    yank                        ,y

- format
                    tabularize =                l=
                    tabularize :                l.

- edit
                    quick buffer paste
                    show buffers


- git
                    status                      às / àà
                    commit                      àc
                    diff                        àd
                    log                         àl
                    (add)                       àa

- options
                    toggle relative/number/off  çn
                    toggle paste                çp
                    toggle hightlight search    çh
                    toggle folding              çf
                    light/dark                  çb
                    toggle syntax               çs

- vimrc
                    source                      ,sv             ?
                    edit                        ,ev             ?
                    source current file         ,ss             ?

                    reindent file   mwgg=G'm                    ?
                    :Ex                                         ?

- emmet mode insert
