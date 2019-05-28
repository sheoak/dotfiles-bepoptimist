
Nvim configuration files
========================

**Note**:
*The documentation is under refactoring and is not updated at the moment*.

I use this config mainly for:

- Programming under git versionning (PHP/JS/HTML/CSS/Python/Bash)
- Text/Mail editing

Please note that \ is not leader in this configuration ("," is) and ";," have
been moved to "< >", taking advantage of the bépo layout (see [bepoptimist][1]
plugin)

I used [dougblack.io][2] to help me organize and used a few settings/functions
suggested. I also used some of [Doug Ireton mirror pond settings][3]. Thank you
to all the people behind the plugins I used, it’s awesome!


Dependencies:
-------------

- vim-plug:   https://github.com/junegunn/vim-plug
- git:        for vim-fugitive plugin (optionnal)
- jshint:     for syntastic — npm install -g jshint (optionnal)
- languagetool: for grammar checking


Installation:
-------------

copy this file to `~/.vimrc` for vim or `~/.local/nvim/init.vim` for neovim
manually install vim-plug as instructed.
I don't maintain vim version anymore so you will have to modify some code
to make it work.

**Tip**: Setting your keyboard key repeat and speed high will give you a better
experince in vim! But don't abuse the homerow and make use of the many
additionnal motions and text-objects installed in this configuration! (see
documentation).

[1]: https://github.com/sheoak/vim-bepoptimist
[2]: http://dougblack.io/words/a-good-vimrc.html
[3]: https://github.com/dougireton/mirror_pond/blob/master/vimrc
