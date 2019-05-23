
if (!exists("g:plugs['denite']"))
    finish
endif

" temporory fix for devicons (deprecated sources):
call denite#custom#source('file,file/rec,file/mru,file/old,file/point',
    \ 'converters', ['devicons_denite_converter'])

call denite#custom#option('default', { 'prompt': '❯' })
call denite#custom#option('default', { 'reversed': 'true' })
call denite#custom#option('default', { 'winheight': '15' })

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
call denite#custom#source( 'grep', 'matchers', [ 'matcher_regexp' ])

" Denite for git
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
    \ ['git', 'ls-files', '-co', '--exclude-standard'])

" Denite for git dotfiles, bare repository
call denite#custom#alias('source', 'file/rec/git-dotfiles', 'file/rec')
call denite#custom#var('file/rec/git-dotfiles', 'command', [
    \ 'git', '--git-dir=' . $DOTFILES_REPOSITORY, '--work-tree=' . $HOME,
    \ 'ls-files', '-c', '--exclude-standard'])

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

call denite#custom#map(
      \ 'insert',
      \ '<C-t>',
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

    " Toggle hidden files on/off for file/rec search with ag
    " Only if ag is active
    nnoremap <silent> [o. :call denite#custom#var('file/rec', 'command',
        \ ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', ''])<CR>
    nnoremap <silent> ]o. :call denite#custom#var('file/rec', 'command',
        \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])<CR>
endif

