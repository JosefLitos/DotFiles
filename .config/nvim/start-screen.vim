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
			\ { 'st': '~/DotFiles/theming/st-master/config.h' },
			\ { 'ic': '~/.config/i3/def.config' },
			\ { 'i3': '~/.config/i3/' },
			\ { 'ib': '~/.config/i3blocks/' },
			\ { 'pi': '~/.config/picom/picom.conf' },
			\ { 'ra': '~/.config/ranger/rc.conf' },
			\ { 'rf': '~/.config/rofi/config.rasi' },
			\ { 'fn': '~/.config/fontconfig/fonts.conf' },
			\ { 'fc': '~/.config/fish/config.fish' },
			\ { 'vi': '~/.config/nvim/' }
			\ ]

let g:startify_change_to_vcs_root = 1
let g:startify_session_autoload = 1
let g:startify_enable_special = 0
