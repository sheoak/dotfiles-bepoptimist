#! /bin/sh
#
# yarn-lock-autofix.sh
# Copyright (C) 2021 Sheoak <sheoak@users.noreply.github.com>
#
# Distributed under terms of the MIT license.
git checkout origin/master -- yarn.lock
yarn install
git add yarn.lock
git rebase --continue
