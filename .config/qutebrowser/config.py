#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8

"""
Qutebrowser configuration file with bepo and french settings
Author: sheoak <dev@sheoak.fr>
"""

# ----------------------------------------------------------------------------
# System Configuration
# You probably want to edit this section with your own values
# ----------------------------------------------------------------------------

# where to save …
download_path = '~/downloads'
download_path_video = '~/videos/youtube'
download_path_music = '~/videos/youtube/mp3'
download_path_tabs = '~/music/tabs'
download_path_pdf = '~/downloads'

# commands to download youtube videos/extract mp3
yt_download_cmd = "youtube-dl -o '" + download_path_video \
        + "/%(title)s.%(ext)s'"
yt_download_mp3_cmd = "youtube-dl --audio-format mp3 --audio-quality 7 \
        --restrict-filenames --extract-audio -o '" \
        + download_path_music + "/%(title)s.%(ext)s'"

# fonts are very small on hidpi
c.zoom.default = 100

# I have many graphical bugs with webengine…
# c.backend = 'webkit'

# ----------------------------------------------------------------------------
# General settings
# ----------------------------------------------------------------------------

# nothing is more annoying than a mouse, except autoplay
c.qt.args.append('autoplay-policy=user-gesture-required')

# ---------------------------------------------------------------------------
# Custom search engines
# ---------------------------------------------------------------------------
c.url.start_pages = 'about:blank'
# c.url.searchengines["DEFAULT"] = "https://www.google.fr/search?q={}"
c.url.searchengines["DEFAULT"] = "https://lite.qwant.com/?l=fr&t=web&q={}"
c.url.searchengines["g"] = "https://www.google.com/search?hl=en&q={}"
c.url.searchengines["y"] = "https://www.youtube.com/results?search_query={}"
c.url.searchengines["q"] = "https://lite.qwant.com/?t=web&q={}"
c.url.searchengines["Q"] = "https://www.qwant.com/?q={}&t=web"
c.url.searchengines["a"] = "https://wiki.archlinux.org/?search={}"
c.url.searchengines["w"] = "https://en.wikipedia.org/wiki/{}"
c.url.searchengines["wa"] = "https://wiki.archlinux.org/index.php?search={}"
# pylint: disable=line-too-long
c.url.searchengines["s"] = "https://www.searx.me/?q={}&category_general=on&time_range=&language=en-us" # noqa
c.url.searchengines["m"] = "http://www.openstreetmap.org/search?query={}"
c.url.searchengines["gm"] = "https://www.google.fr/maps/place/{}"
c.url.searchengines["p"] = "http://php.net/manual-lookup.php?pattern={}&scope=quickref" # noqa
c.url.searchengines["d"] = "https://developer.mozilla.org/fr/search?q={}"


# ---------------------------------------------------------------------------
# Custom folders
# ---------------------------------------------------------------------------
config.set('downloads.location.directory', download_path)
config.set('downloads.position', 'bottom')
config.set('downloads.location.prompt', False)
# config.set('downloads.remove_finished', 20000)
config.set('hints.min_chars', 1)

# ---------------------------------------------------------------------------
# BEPO bindings
# ---------------------------------------------------------------------------

# remap homerow for bépo
config.unbind('j')
config.unbind('k')
config.unbind('l')
config.unbind('n')

config.bind('r', 'scroll up')
config.bind('s', 'scroll down')
config.bind('t', 'scroll left')
config.bind('n', 'scroll right')

config.bind('l', 'scroll right')
config.bind('L', 'scroll right')

# left hand control, nice when using mouse
config.bind('«', 'back')
config.bind('»', 'forward')
config.bind('æ', 'back')
config.bind('€', 'forward')

config.bind('l', 'search-next')
config.bind('L', 'search-prev')

# we need to move the reload key
config.bind('<Ctrl-R>', 'reload -f')
# h alone is a little bit dangerous if escaping insert mode by mistake
config.bind('hh', 'reload')

# CARET Mode -----------------------------------------------------------------
config.bind('r', 'move-to-prev-line', 'caret')
config.bind('s', 'move-to-next-line', 'caret')
config.bind('t', 'move-to-prev-char', 'caret')
config.bind('n', 'move-to-next-char', 'caret')

config.bind('R', 'scroll up', 'caret')
config.bind('S', 'scroll down', 'caret')
config.bind('T', 'scroll left', 'caret')
config.bind('N', 'scroll right', 'caret')

# ----------------------------------------------------------------------------

# hints for bepo
c.hints.chars = 'aiuectsrn'

# switch : and .
# config.bind(':', 'repeat-command')
# config.bind('.', 'set-cmd-text :')

# ---------------------------------------------------------------------------
# FRENCH Settings
# ---------------------------------------------------------------------------

# french next/prev links
c.hints.prev_regexes.append(r'\bprécédent\b')
c.hints.next_regexes.append(r'\bsuivant\b')
config.bind('<', 'navigate prev')
config.bind('>', 'navigate next')

# ---------------------------------------------------------------------------
# Misc. bindings
# ---------------------------------------------------------------------------

# fill password with user script and pass
# the username must be set as the second line with user: prefix
# it will use rofi, see ~/.config/qutebrowser/password_fill_rc file
config.bind('éé', 'spawn --userscript password_fill')

config.bind('F', 'hint all window')
# d is a dangerous shortcut if you forget to go in insert mode…
# i3 shortcut works or dd
# Ctrl-q still closes all windows
config.unbind('d')
config.bind('<Ctrl-d>', 'tab-close')
config.bind('éq', 'tab-close')
config.bind('éo', 'window-only')

# edit with nvim (use ctrl-e in insert mode)
config.bind('e', 'open-editor')

# Firefox like shortcuts for private window
config.bind('<Ctrl-Shift-p>', 'set-cmd-text -s :open -p ')

# nvim-bepoptimist shortcuts
config.bind('éq', 'tab-close')
config.bind('èq', 'quit')

config.bind('<Backspace>', 'scroll-page 0 -1')
config.bind('<Return>', 'scroll-page 0 1')

# like vim
config.bind('u', 'undo')
config.bind('!', 'set-cmd-text -s :spawn')

# ---------------------------------------------------------------------------
# Tab and window setting
# ---------------------------------------------------------------------------

# just in case something opens a tab, but the conf is made
# for no-tab use, letting i3 handle what it does better than qutebrowser
c.tabs.show = 'multiple'

# do not use tabs, i3 handles it better
c.tabs.tabs_are_windows = True
c.tabs.background = False
# allow use of 'dd' to close window
c.tabs.last_close = 'close'

# unbind tab stuff…
config.unbind('g$')
config.unbind('g0')
config.unbind('gl')
config.unbind('gr')
config.unbind('ga')
config.unbind('g^')
config.unbind('gC')
config.unbind('gO')

# but in case an annoying tab pops in, vim style navigation
config.bind('gt', 'tab-next')
config.bind('gT', 'tab-prev')

# always open a new window, never use tabs
config.bind('O', 'set-cmd-text -s :open -w ')

# ---------------------------------------------------------------------------
# Cycle options using ,
# ---------------------------------------------------------------------------

# ad blocking
# c.content.host_blocking.lists = \
#         ['https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts']

c.content.host_blocking.enabled = True
c.content.host_blocking.lists = \
        ['https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/social/hosts'] # noqa

config.bind(',h', 'config-cycle -t -p content.host_blocking.enabled')

# toggle private mode for next openned window
config.bind(',p', 'config-cycle -t -p content.private_browsing')

# ---------------------------------------------------------------------------
# Bookmarks (b) / quickmarks (a)
# ---------------------------------------------------------------------------

config.bind('aa', ':set-cmd-text -s :quickmark-add {url}')
config.bind('A', 'open qute://bookmarks#quickmarks')
config.bind('aB', 'open -w qute://bookmarks#quickmarks')
config.bind('ad', ':quickmark-del')
config.bind('aD', 'set-cmd-text -s :quickmark-del')
config.bind('al', 'set-cmd-text -s :quickmark-load')
config.bind('aL', 'set-cmd-text -s :quickmark-load -w')

config.unbind('b')
config.bind('ba', 'bookmark-add')
config.bind('B', 'open qute://bookmarks#bookmarks')
config.bind('bB', 'open -w qute://bookmarks#bookmarks')
config.bind('bd', 'bookmark-del')
config.bind('bD', 'set-cmd-text -s :bookmark-del')
config.bind('bl', 'set-cmd-text -s :bookmark-load')
config.bind('bL', 'set-cmd-text -s :bookmark-load -w')

# ----------------------------------------------------------------------------
# g* shotcuts: [g]o to…
# ----------------------------------------------------------------------------

# Quick access to…
# config.bind('gb',  'open qute://bookmarks')
config.bind('gc', 'open qute://settings')
config.bind('gC', 'open -w qute://settings')
config.bind('ge', 'config-edit')
config.bind('gs', 'config-source')
config.bind('gi', 'inspector')
config.bind('gh', 'history')
config.bind('gH', 'history -w')

# we use k for help as in vim (K) because h is taken
config.bind('gk', 'set-cmd-text -s :help')
config.bind('gK', 'open https://qutebrowser.org/doc/help/settings.html')

# Printing…
config.bind('gp', 'print --preview')
config.bind('gP', 'print')

# open video in mpv
config.bind('gm', 'spawn mpv {url}')
config.bind('gM', 'hint links spawn mpv {hint-url}')

# ----------------------------------------------------------------------------
# y* additionnal shortcuts
# ----------------------------------------------------------------------------

# missing yank selection
config.bind('yv', 'yank selection')
config.bind('yV', 'yank -s selection')

# ----------------------------------------------------------------------------
# Download shortcuts (l*)
# ----------------------------------------------------------------------------

# Clear the download list quickly
config.bind('dc', 'download-clear')
config.bind('du', 'download-cancel')
config.bind('dd', 'download-open')
config.bind('dh', 'download-retry')
config.bind('dR', 'download-delete')
config.bind('dr', 'download-remove')
config.bind('ds', ':set-cmd-text :download ')
# downloads guitar tabs as pdf (ask for file name)
config.bind('dt', ':set-cmd-text :print --pdf ' + download_path_tabs + '/')
# download as pdf
config.bind('dp', ':set-cmd-text :print --pdf ' + download_path_pdf + '/')

# yv : youtube to video
config.bind('dy', 'spawn ' + yt_download_cmd
            + ' {url} ;; message-info "Downloading video to '
            + download_path_video + '…"')

# ym : youtube to mp3
config.bind('dY', 'spawn ' + yt_download_mp3_cmd
            + ' {url} ;; message-info "Extracting audio to '
            + download_path_music + '…"')

# ----------------------------------------------------------------------------
# Per domain settings
#
# TODO: How to activate passthough per domain?
# ----------------------------------------------------------------------------
# config.set('content.images', False, '*google.*/maps/*')

# ----------------------------------------------------------------------------
# Styles
# ----------------------------------------------------------------------------

# custom CSS
c.content.user_stylesheets.append('user.css')

# fonts configuration
c.fonts.monospace = '12px Deja Vu Sans Mono'
c.fonts.prompts = '10px'
c.fonts.messages.error = '10px Hack'
c.fonts.messages.info = '10px'
c.fonts.messages.warning = '10px'
c.fonts.hints = '10px Hack'
c.fonts.statusbar = '11px Hack'
c.fonts.completion.entry = '10px Hack'
c.fonts.completion.category = '10px'
c.fonts.downloads = '10px'
c.hints.border = '1px solid'

# Solarized theme by YouNeverWalkAlone
# https://www.reddit.com/r/qutebrowser/comments/77eqiq/solarized_or_base16_color_theme_for_qutebrowser/
solarized = {
    'base03': '#002b36',
    'base02': '#073642',
    'base01': '#586e75',
    'base00': '#657b83',
    'base0': '#839496',
    'base1': '#93a1a1',
    'base2': '#eee8d5',
    'base3': '#fdf6e3',
    'yellow': '#b58900',
    'orange': '#cb4b16',
    'red': '#dc322f',
    'magenta': '#d33682',
    'violet': '#6c71c4',
    'blue': '#268bd2',
    'cyan': '#2aa198',
    'green': '#859900'
}

# Background color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.bg = solarized['base03']

# Bottom border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.bottom = solarized['base03']

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.top = solarized['base03']

# Foreground color of completion widget category headers.
# Type: QtColor
c.colors.completion.category.fg = solarized['base3']

# Background color of the completion widget for even rows.
# Type: QssColor
c.colors.completion.even.bg = solarized['base02']

# Text color of the completion widget.
# Type: QtColor
c.colors.completion.fg = solarized['base3']

# Background color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.bg = solarized['violet']

# Bottom border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.bottom = solarized['violet']

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.item.selected.border.top = solarized['violet']

# Foreground color of the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.fg = solarized['base3']

# Foreground color of the matched text in the completion.
# Type: QssColor
c.colors.completion.match.fg = solarized['base2']

# Background color of the completion widget for odd rows.
# Type: QssColor
c.colors.completion.odd.bg = solarized['base02']

# Color of the scrollbar in completion view
# Type: QssColor
c.colors.completion.scrollbar.bg = solarized['base0']

# Color of the scrollbar handle in completion view.
# Type: QssColor
c.colors.completion.scrollbar.fg = solarized['base2']

# Background color for the download bar.
# Type: QssColor
c.colors.downloads.bar.bg = solarized['base03']

# Background color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.bg = solarized['red']

# Foreground color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.fg = solarized['base3']

# Color gradient start for download backgrounds.
# Type: QtColor
# c.colors.downloads.start.bg = '#0000aa'

# Color gradient start for download text.
# Type: QtColor
c.colors.downloads.start.fg = solarized['base3']

# Color gradient stop for download backgrounds.
# Type: QtColor
# c.colors.downloads.stop.bg = '#00aa00'

# Color gradient end for download text.
# Type: QtColor
# c.colors.downloads.stop.fg = solarized['base3']

# Color gradient interpolation system for download backgrounds.
# Type: ColorSystem
# Valid values:
#   - rgb: Interpolate in the RGB color system.
#   - hsv: Interpolate in the HSV color system.
#   - hsl: Interpolate in the HSL color system.
#   - none: Don't show a gradient.
# c.colors.downloads.system.bg = 'rgb'

# Color gradient interpolation system for download text.
# Type: ColorSystem
# Valid values:
#   - rgb: Interpolate in the RGB color system.
#   - hsv: Interpolate in the HSV color system.
#   - hsl: Interpolate in the HSL color system.
#   - none: Don't show a gradient.
# c.colors.downloads.system.fg = 'rgb'

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
# Type: QssColor
c.colors.hints.bg = solarized['violet']

# Font color for hints.
# Type: QssColor
c.colors.hints.fg = solarized['base3']

# Font color for the matched part of hints.
# Type: QssColor
c.colors.hints.match.fg = solarized['base2']

# Background color of the keyhint widget.
# Type: QssColor
# c.colors.keyhint.bg = 'rgba(0, 0, 0, 80%)'

# Text color for the keyhint widget.
# Type: QssColor
c.colors.keyhint.fg = solarized['base3']

# Highlight color for keys to complete the current keychain.
# Type: QssColor
c.colors.keyhint.suffix.fg = solarized['yellow']

# Background color of an error message.
# Type: QssColor
c.colors.messages.error.bg = solarized['red']

# Border color of an error message.
# Type: QssColor
c.colors.messages.error.border = solarized['red']

# Foreground color of an error message.
# Type: QssColor
c.colors.messages.error.fg = solarized['base3']

# Background color of an info message.
# Type: QssColor
c.colors.messages.info.bg = solarized['base03']

# Border color of an info message.
# Type: QssColor
c.colors.messages.info.border = solarized['base03']

# Foreground color an info message.
# Type: QssColor
c.colors.messages.info.fg = solarized['base3']

# Background color of a warning message.
# Type: QssColor
c.colors.messages.warning.bg = solarized['orange']

# Border color of a warning message.
# Type: QssColor
c.colors.messages.warning.border = solarized['orange']

# Foreground color a warning message.
# Type: QssColor
c.colors.messages.warning.fg = solarized['base3']

# Background color for prompts.
# Type: QssColor
c.colors.prompts.bg = solarized['base02']

# Border used around UI elements in prompts.
# Type: String
c.colors.prompts.border = '1px solid ' + solarized['base3']

# Foreground color for prompts.
# Type: QssColor
c.colors.prompts.fg = solarized['base3']

# Background color for the selected item in filename prompts.
# Type: QssColor
c.colors.prompts.selected.bg = solarized['base01']

# Background color of the statusbar in caret mode.
# Type: QssColor
c.colors.statusbar.caret.bg = solarized['blue']

# Foreground color of the statusbar in caret mode.
# Type: QssColor
c.colors.statusbar.caret.fg = solarized['base3']

# Background color of the statusbar in caret mode with a selection.
# Type: QssColor
c.colors.statusbar.caret.selection.bg = solarized['violet']

# Foreground color of the statusbar in caret mode with a selection.
# Type: QssColor
c.colors.statusbar.caret.selection.fg = solarized['base3']

# Background color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.bg = solarized['base03']

# Foreground color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.fg = solarized['base3']

# Background color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.bg = solarized['base01']

# Foreground color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.fg = solarized['base3']

# Background color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.bg = solarized['green']

# Foreground color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.fg = solarized['base3']

# Background color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.bg = solarized['base03']

# Foreground color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.fg = solarized['base3']

# Background color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.bg = solarized['base01']

# Foreground color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.fg = solarized['base3']

# Background color of the progress bar.
# Type: QssColor
c.colors.statusbar.progress.bg = solarized['base3']

# Foreground color of the URL in the statusbar on error.
# Type: QssColor
c.colors.statusbar.url.error.fg = solarized['red']

# Default foreground color of the URL in the statusbar.
# Type: QssColor
c.colors.statusbar.url.fg = solarized['base3']

# Foreground color of the URL in the statusbar for hovered links.
# Type: QssColor
c.colors.statusbar.url.hover.fg = solarized['base2']

# Foreground color of the URL in the statusbar on successful load
# (http).
# Type: QssColor
c.colors.statusbar.url.success.http.fg = solarized['base3']

# Foreground color of the URL in the statusbar on successful load
# (https).
# Type: QssColor
c.colors.statusbar.url.success.https.fg = solarized['base3']

# Foreground color of the URL in the statusbar when there's a warning.
# Type: QssColor
c.colors.statusbar.url.warn.fg = solarized['yellow']

# Background color of the tab bar.
# Type: QtColor
# c.colors.tabs.bar.bg = '#555555'

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = solarized['base01']

# Foreground color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.fg = solarized['base2']

# Color for the tab indicator on errors.
# Type: QtColor
c.colors.tabs.indicator.error = solarized['red']

# Color gradient start for the tab indicator.
# Type: QtColor
c.colors.tabs.indicator.start = solarized['violet']

# Color gradient end for the tab indicator.
# Type: QtColor
c.colors.tabs.indicator.stop = solarized['orange']

# Color gradient interpolation system for the tab indicator.
# Type: ColorSystem
# Valid values:
#   - rgb: Interpolate in the RGB color system.
#   - hsv: Interpolate in the HSV color system.
#   - hsl: Interpolate in the HSL color system.
#   - none: Don't show a gradient.
# c.colors.tabs.indicator.system = 'rgb'

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = solarized['base01']

# Foreground color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.fg = solarized['base2']

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = solarized['base03']

# Foreground color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.fg = solarized['base3']

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = solarized['base03']

# Foreground color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.fg = solarized['base3']

# Background color for webpages if unset (or empty to use the theme's
# color)
# Type: QtColor
# c.colors.webpage.bg = 'white'
