""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom mappings
" See bepotimist for homerow related mappings (tsrn)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't use Ex mode, use Q for formatting
noremap Q gq

" Rewrite some vim maps in insert mode, not that usefull anyway:
inoremap <C-j> <C-x><C-]>
inoremap <C-f> <C-x><C-f>
inoremap <C-l> <C-x><C-l>
inoremap <C-o> <C-x><C-o>

" open file under cursor
nnoremap gF :e <cfile><CR>

" don't override register when pasting over
xnoremap p pgvy

" page up/down
noremap <BS> <PageUp>
noremap <Space> <PageDown>

" terminal escape instead of C-\ C-n
tnoremap <C-g> <C-\><C-n>

" EeasyAlign (, is leader)
nmap \ <Plug>(EasyAlign)
xmap \ <Plug>(EasyAlign)

" -----------------------------------------------------------------------------
" Vim-unimpaired-like mappings [* ]* y*
" See bepotimist for remapping of conflicts (>p/»p)
" -----------------------------------------------------------------------------

" ALE
nnoremap <silent> ]oa :ALEDisable<cr>
nnoremap <silent> [oa :ALEEnable<cr>
nnoremap <silent> yoa :ALEToggle<cr>
nnoremap <silent> ylf :ALEFix<cr>
nnoremap <silent> yld :ALEDetail<cr>
nnoremap <silent> [h :ALEPrevious<cr>
nnoremap <silent> ]h :ALENext<cr>

" Deoplete
nnoremap <silent> ]o<tab> :call deoplete#disable()
nnoremap <silent> ]o<tab> :call deoplete#enable()
nnoremap <silent> yo<tab> :call deoplete#toggle()

" vim-markdown
nmap [om <Plug>MarkdownPreview
nmap ]om <Plug>MarkdownPreviewStop
nmap yom <Plug>MarkdownPreviewToggle

" Git-gutter
nmap ]og :GitGutterLineHighlightsDisable<CR>
nmap [og :GitGutterLineHighlightsEnable<CR>
nmap yog :GitGutterLineHighlightsToggle<CR>

" table-mode
nnoremap ]ot :TableModeEnable<CR>
nnoremap [ot :TableModeDisable<CR>
nnoremap yot :TableModeToggle<CR>

" Goyo
nnoremap yoy :Goyo

" Grammarous
nmap ]g <Plug>(grammarous-move-to-next-error)
nmap [g <Plug>(grammarous-move-to-previous-error)

" -----------------------------------------------------------------------------

" Neosnippets
" Note: It must be "imap" and "smap"
" -----------------------------------------------------------------------------
imap <C-space> <Plug>(neosnippet_expand_or_jump)
smap <C-space> <Plug>(neosnippet_expand_or_jump)
xmap <C-space> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Table-mode
" Memo: þ is AltGr+T ([T]able)
" -----------------------------------------------------------------------------
nnoremap þþ :TableModeToggle<CR>
nnoremap þs :TableModeSort<CR>
nnoremap þf :TableModeAddFormula<CR>
nnoremap þe :TableModeEvalFormulaLine<CR>
nnoremap þt <Plug>(table-mode-tableize)
xnoremap þt <Plug>(table-mode-tableize)
xnoremap þd <Plug>(table-mode-tableize-delimiter)

" Sneak
" Some mappings are in vim-bepoptimist plugin (homerow remap and <>)
nmap é <Plug>Sneak_s
xmap é <Plug>Sneak_s
omap é <Plug>Sneak_s
nmap É <Plug>Sneak_S
xmap É <Plug>Sneak_S
omap É <Plug>Sneak_S

" label-mode
nmap gé <Plug>SneakLabel_s
nmap gÉ <Plug>SneakLabel_S

" Grammarous
" Memo: ß is AltGr+S ([S]pell)
" -----------------------------------------------------------------------------
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

" Vim spell
nmap ßf :set spelllang=fr<CR>
nmap ße :set spelllang=en<CR>
nmap ßm :set spelllang=en,fr<CR>
nmap ßs z=

" Thesaurus
nnoremap ßt :ThesaurusQueryReplaceCurrentWord<CR>
nnoremap ßT :Thesaurus<space>
nnoremap ßq :ThesaurusQueryReplace<space>

" Operator
omap ß <Plug>(operator-grammarous)

" CamelCase motions
" -----------------------------------------------------------------------------

" motions
nmap <silent> ç <Plug>CamelCaseMotion_w
nmap <silent> Ç <Plug>CamelCaseMotion_b
nmap <silent> gç <Plug>CamelCaseMotion_e
nmap <silent> gÇ <Plug>CamelCaseMotion_ge
vmap <silent> ç <Plug>CamelCaseMotion_w
vmap <silent> Ç <Plug>CamelCaseMotion_b
vmap <silent> gç <Plug>CamelCaseMotion_e
vmap <silent> gÇ <Plug>CamelCaseMotion_ge

" text-objects
omap <silent> aç <Plug>CamelCaseMotion_iw
xmap <silent> aç <Plug>CamelCaseMotion_iw
omap <silent> iç <Plug>CamelCaseMotion_ib
xmap <silent> iç <Plug>CamelCaseMotion_ib

" vim-arguments
" -----------------------------------------------------------------------------
nmap g« <Plug>Argumentative_MoveLeft
nmap g» <Plug>Argumentative_MoveRight

" Sneak
" -----------------------------------------------------------------------------
" Defined in bepoptimist

" vim-bookmarks
" -----------------------------------------------------------------------------
nnoremap ms <Plug>BookmarkShowAll

" Surround
" s has been remapped by bepoptimist (homerow)
nmap dk  <Plug>Dsurround
nmap ck  <Plug>Csurround
nmap cK  <Plug>CSurround
nmap yk  <Plug>Ysurround
nmap yK  <Plug>YSurround
nmap ykk <Plug>Yssurround
nmap yKk <Plug>YSsurround
xmap k   <Plug>VSurround
xmap K   <Plug>VgSurround

" Sneak
" See bepoptimist

" label-mode
nmap gé <Plug>SneakLabel_s
nmap gÉ <Plug>SneakLabel_S

" Gundo
" See bepoptimist

" -----------------------------------------------------------------------------
" GIT mappings
" -----------------------------------------------------------------------------

" Fugitive mappings
nnoremap ’b :Gblame<CR>
nnoremap ’c :Gcommit<CR>
nnoremap ’d :Gdiff<CR>
nnoremap ’e :Gedit<CR>
nnoremap ’fd :Gremove<CR>
nnoremap ’fm :Gmove<CR>
nnoremap ’i :Gpull<CR>
nnoremap ’l :Glog --oneline<CR>
nnoremap ’m :Ghove<CR>
nnoremap ’p :Gpush<CR>
nnoremap ’r :Grebase<CR>
nnoremap ’s :Gstatus<CR>
nnoremap ’w :Gwrite<CR>

" FZF
nnoremap ’’ :GFiles<CR>
nnoremap ’h :Commits!<CR>
nnoremap ’H :CBommits!<CR>

" GitGutter mappings
nmap ’a <Plug>GitGutterStageHunk
nmap ’u <Plug>GitGutterUndoHunk
nmap ’z <Plug>GitGutterPreviewHunk

" nvim-gdb
" Memo: ð is AltGr+d ([d]ebug)
" -----------------------------------------------------------------------------
nnoremap ðð <C-w><C-p>
nnoremap ðg :GdbStart gdb -q ./a.out
nnoremap ðl :GdbStartLLDB lldb ./a.out
nnoremap ðp :GdbStartPDB python -m pdb main.py
nnoremap ð<Return> :GdbContinue<CR>
nnoremap ð<Space> :GdbStep<CR>
nnoremap ðu :GdbUntil<CR>
nnoremap ðn :GdbNext<CR>
nnoremap ðh :GdbFinish<CR>
nnoremap ðt :GdbBreakpointToggle<CR>
nnoremap ð< :GdbFrameUp<CR>
nnoremap ð> :GdbFrameDown<CR>
nnoremap ðe :GdbEvalWord<CR>
vnoremap ðe :GdbEvalRange<CR>
nnoremap ðd :GdbBreakpointClearAll<CR>
nnoremap ði :GdbInterrupt<CR>
nnoremap ðq :GdbDebugStop<CR>

" viewdoc
" -----------------------------------------------------------------------------
" TODO

" -----------------------------------------------------------------------------
" Leader mappings:
" -----------------------------------------------------------------------------
" All leader mappings are use for file managment: actions on file, buffers…
"
" This mainly use Denite and FZF or basic actions like saving file
"
" - FZF is faster and better for easy actions (open file, complete line…)
" - Denite has more option and is better for custom action (tab open, append…)
"
" Case:
" For file browsing, lowercase means files and directory in most cases
" but it sometimes doesn't make sense as sources can be mixed
"
" Suffix:
" if leader is follow by of these keys, it will modify the next command:
"
" c     apply on [c]urrent buffer directory
" h     apply on [h]ome directory
" !     force next action (force save readonly…) or important action
" .     repeat for all files
"
" ,ct search in current directory (t=recursive)
" ,hb browser the home directory (not recursive)
"
" Combination:
" - ,.S force (S) save all (.) files
"            
"
" For file saving/exiting, uppercase mean 'for all files'
" -----------------------------------------------------------------------------

" Faster than Denite, we use fzf when only need to open files
nnoremap <Tab> :Buffers<CR>

" Common actions (no plugin)
nmap <leader>s :w<CR>
nmap <leader>S :w!<CR>
nmap <leader>.s :wa<CR>
nmap <leader>.S :wa!<CR>
nmap <leader>w :saveas<space>
nmap <leader>W :saveas!<space>
nmap <leader>q :q<CR>
nmap <leader>Q :q!<CR>
nmap <leader>.q :qa<CR>
nmap <leader>.Q :qa!<CR>
nmap <leader>x :x<CR>
nmap <leader>X :x!<CR>
" for logic, but built-in ZZ is quicker
nmap <leader>.x :xa<CR>
nmap <leader>.X :xa!<CR>
nmap <leader>d :bdelete<CR>
nmap <leader>D :bdelete!<CR>
nmap <leader>.d :bufdo bdelete<CR>
nmap <leader>.D :bufdo bdelete!<CR>

" FZF
nnoremap <leader>, :FZF ~<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <leader><space> :History<CR>
nnoremap <leader>m :Marks<CR>
nnoremap <leader>: :History:<CR>

" Startify
nnoremap <leader>v :Startify<CR>

" Recent and favorites
" Alternative to fzf when action is needed:
nnoremap <leader><Tab> :<C-u>Denite -auto-resize buffer<CR>
nnoremap <leader><CR> :<C-u>Denite -resume<CR>

" [R]ecent
nnoremap <leader>r :<C-u>Denite file_mru<CR>
nnoremap <leader>R :<C-u>Denite directory_mru<CR>

" Recursive ([T]ree) files/folders
nnoremap <leader>t :<C-u>DeniteProjectDir file/rec<CR>
nnoremap <leader>ct :<C-u>DeniteBufferDir file/rec<CR>
nnoremap <leader>ht :<C-u>Denite -path=~ file/rec<CR>
nnoremap <leader>T :<C-u>DeniteProjectDir directory_rec<CR>
nnoremap <leader>cT :<C-u>DeniteBufferDir directory_rec<CR>
nnoremap <leader>hT :<C-u>Denite -path=~ directory_rec<CR>

" [b]rowse (file/directory non recursive)
nnoremap <leader>b :<C-u>DeniteProjectDir file<CR>
nnoremap <leader>cb :<C-u>DeniteBufferDir file<CR>
nnoremap <leader>hb :<C-u>Denite -path=~ file<CR>

" [G]it
nnoremap <leader>g :<C-u>DeniteProjectDir
    \ `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`<CR>
nnoremap <leader>cg :<C-u>DeniteBufferDir
    \ `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`<CR>
nnoremap <leader>hg :<C-u>Denite -path=~ file/rec/git-dotfiles<CR>

" Ranger
nnoremap <leader>e :RangerWorkingDirectory<CR>
nnoremap <leader>ce :RangerCurrentFile<CR>
nnoremap <leader>he :Ranger ~<CR>

" Searching
nnoremap <leader># :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
" nnoremap <leader>/ :<C-u>DeniteProjectDir grep:. -mode=normal<CR>
nnoremap <leader>/ :Ag
nnoremap <leader>a :DeniteProjectDir -buffer-name=grep -default-action=quickfix grep:::!<CR>
nnoremap <leader>ca :DeniteBufferDir -buffer-name=grep -default-action=quickfix grep:::!<CR>
nnoremap <leader>ha :Denite -path=~ -buffer-name=grep -default-action=quickfix grep:::!<CR>

" Others
nnoremap <leader>à :<C-u>Denite jump<CR>
nnoremap <leader>À :<C-u>Denite tag<CR>
nnoremap <leader>ç :<C-u>Denite colorscheme<CR>
nnoremap <leader>C :<C-u>Denite change<CR>
nnoremap <leader>j :<C-u>Denite emoji<CR>
nnoremap <leader>k :<C-u>Denite help<CR>
nnoremap <leader>l :<C-u>Denite line<CR>
nnoremap <leader>L :<C-u>Denite line:buffers<CR>
nnoremap <leader>n :<C-u>Denite outline<CR>
nnoremap <leader>M :<C-u>Denite mark<CR>
nnoremap <leader>p :<C-u>Denite neosnippet<CR>
nnoremap <leader>o :<C-u>Denite output:!
nnoremap <leader>u :<C-u>:Gundo<CR>
nnoremap <leader>y :<C-u>Denite register<CR>
nnoremap <leader>z :<C-u>Denite spell<CR>
nnoremap <leader>Z :<C-u>Denite grammarous<CR>
nnoremap <leader>… :<C-u>Denite command_history<CR>
nnoremap <leader>@ :<C-u>Denite command<CR>
nnoremap <leader>?a :<C-u>Denite output:map<CR>
nnoremap <leader>?n :<C-u>Denite output:nmap<CR>
nnoremap <leader>?i :<C-u>Denite output:imap<CR>
nnoremap <leader>?x :<C-u>Denite output:xmap<CR>
nnoremap <leader>?o :<C-u>Denite output:omap<CR>

" -----------------------------------------------------------------------------
" Insert mode mapping for completion
" -----------------------------------------------------------------------------
imap <c-k> <plug>(fzf-complete-word)
imap <c-l> <plug>(fzf-complete-line)
inoremap <expr> <c-x><c-j> fzf#vim#complete#path('ag --hidden -l -g ""')

" Global line completion (not just open buffers. ripgrep required.)
" TODO: create a command
inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
            \ 'prefix': '^.*$',
            \ 'source': 'rg -n ^ --color always',
            \ 'options': '--ansi --delimiter : --nth 3..',
            \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))


" -----------------------------------------------------------------------------
" Executing
" -----------------------------------------------------------------------------
nmap ;p <Nop>
nmap ;s <Nop>
vmap ;x :call bexec#Visual()<CR>
nmap ;x :call bexec#Normal()<CR>
nmap ;l :call bexec#Live()<CR>
nmap ;sv :source ~/.config/nvim/init.vim<CR>
nmap ;ss :source %<CR>
nmap ;pi :PlugInstall<CR>
nmap ;pu :PlugUpdate<CR>
nmap ;pU :PlugUpgrade<CR>
nmap ;pc :PlugClean<CR>
nmap ;ps :PlugStatus<CR>
nmap ;pd :PlugDiff<CR>
" reinstall plugins quickly
nmap ;pI :w<CR>:source ~/.config/nvim/init.vim<CR>:PlugInstall<CR>
nmap ;m :make<CR>
nmap ;tt :!tox<CR>
nmap ;tp :!pytest<CR>
" [O]rder all css properties
nnoremap ;c :<C-u>g/{/ .+1,/}/-1 sort<CR>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
            \ | wincmd p | diffthis

nnoremap ;do :DiffOrig<CR>

" Clean dirty white space (EOL)
nnoremap ;<space> :silent! %s/\s\+$//<CR>

" Viewdoc
nnoremap S :ViewDoc <cword>
