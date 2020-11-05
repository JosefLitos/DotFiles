let g:startify_custom_header = [
			\'  _          _          \/   _                                     ',
			\' | |    °  _| |_  ___  ____ || ____       __     __ °              ',
			\' | |   |¯||_   _|/ _ \/ ___||// ___|      \ \   / /|¯| \¯\¯\¯\     ',
			\' | |__ | |  | |  ||_||\___ \  \___ \       \ \_/ / | | | | | |     ',
			\' |____||_|  |_|  \___/|____/  |____/        \___/  |_| |_|_|_|     ',
			\]


let g:startify_session_dir = '~/.config/nvim/session'


let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]


let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1


let g:startify_bookmarks = [
            \ { 'st': '~/Documents/bin/st-master/config.h' },
				\ { 'te': '~/.config/termite/config' },
            \ { 'ic': '~/.config/i3/def.config' },
				\ { 'i3': '~/.config/i3/' },
            \ { 'is': '~/.config/i3status/config' },
            \ { 'ib': '~/.config/i3blocks/' },
            \ { 'ra': '~/.config/ranger/rc.conf' },
            \ { 'fc': '~/.config/fish/config.fish' },
            \ { 'fv': '~/.config/fish/fish_variables' },
            \ { 'vi': '~/.config/nvim/' },
            \ { 'xr': '~/.Xresources' },
            \ { 'pi': '~/.config/picom/picom.conf' }
            \ ]

let g:startify_change_to_vcs_root = 1
let g:startify_session_autoload = 1
let g:startify_enable_special = 0
