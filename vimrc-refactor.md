
nmap ,<Backspace>  :call append(line('.')-1, '')<CR>
nmap ,<Enter>      :call append(line('.'), '')<CR>
nmap d<Backspace>  sddt
nmap d<Enter>      tdds

nmap dq :q<CR>          " close window
nmap dQ :q!<CR>         " force close window
nmap dk :bd<CR>         " close buffer
nmap dK :bufdo :bd<CR>  " close all buffers


nmap <Tab>      " buffer toggle :b#
                " file explorer ?
nmap <C-Tab>    " buffer next
nmap <S-Tab>    " buffer previous

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
