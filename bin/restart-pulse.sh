#! /bin/sh
#
# restart-pulse.sh
# Copyright (C) 2021 Sheoak <sheoak@users.noreply.github.com>
#
# Distributed under terms of the MIT license.
#
systemctl --user restart pipewire-pulse.service
systemctl --user restart pipewire-media-session.service
systemctl --user restart pipewire.service
sudo systemctl restart bluetooth.service
