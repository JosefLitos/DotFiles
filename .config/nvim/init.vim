call plug#begin('~/.config/nvim/plugged')
" Files
Plug 'scrooloose/nerdtree'												" IDE-like file browser
Plug 'junegunn/fzf.vim'													" fuzzy finder integration in vim
Plug 'francoiscabrol/ranger.vim'										" ranger file browser integration in vim
" Code Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}					" Code completion and much more
Plug 'honza/vim-snippets'												" buch of snippets to work with CoC
Plug 'mattn/emmet-vim'													" make writing html much more easier
" Syntax highlighting
Plug 'cespare/vim-toml' 												"toml syntax highliting

Plug 'mboughaba/i3config.vim'
Plug 'morhetz/gruvbox'													" gruvbox color scheme used by vim
Plug 'rust-lang/rust.vim'												" better highlighting for rust lang
Plug 'kovetskiy/sxhkd-vim'												" highlighting for sxhkd configuration
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }	" color hex codes will display corresponding color
" Note taking
" Writing, text editing
Plug 'tpope/vim-commentary'											" easy commenting
Plug 'mbbill/undotree'													" complex undo enables moving to already rewritten changes
Plug 'Chiel92/vim-autoformat'											" autoformats file, normally use CoC feature
" Programming
" Misc
Plug 'vim-airline/vim-airline'										" bottom status bar
Plug 'mhinz/vim-startify'												" gives vim pretty start screen (bye bye Uganda), manages stored vim sessions
"Plug 'liuchengxu/vim-which-key'										" guide for key bindings
call plug#end()

" Some basics:
set nocompatible
filetype plugin on
syntax on
set tabstop=3 shiftwidth=3 smarttab
set encoding=utf-8
set norelativenumber number
set clipboard=unnamedplus
set signcolumn=yes
set cmdheight=1
set termguicolors
set cursorline cursorcolumn
set nobackup nowritebackup noswapfile
set linebreak breakindent autoindent smartindent
set hidden noshowmode
set incsearch
set formatoptions-=cro
set splitright splitbelow
set undofile undodir="~/.vim/undo/"
set mouse=a
set title titlestring=%{expand('%:t')}\ -\ NVim
let g:python3_host_prog='/usr/bin/python'
"set timeoutlen=500 updatetime=1000

" Color Scheme, and design
let g:airline_powerline_fonts=0
let g:gruvbox_italic=1
let g:gruvbox_transparent_bg=1
set background=dark
colorscheme gruvbox

" Use UFT-8
setglobal termencoding=utf-8
setglobal fileencodings=utf-8
scriptencoding utf-8
set encoding=utf-8

" Enable autocompletion:
set wildchar=<Tab> wildmenu wildmode=longest,full
set wildignore+=*.a,*.o,*.so,*.pyc,.git
set wildignore+=*.jpg,*.png,*.gif,*.bmp,*.ico,*.pdf
set wildignore+=*.tmp,*.swp

" Vertically center document when entering insert mode
autocmd InsertEnter * norm zz

" Disables automatic comenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Ensure files are read as what I want:
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *config,*.conf,*.config set filetype=config
autocmd BufRead,BufNewFile */X11/xorg* set filetype=xf86conf
autocmd BufRead,BufNewFile */i3/*conf* set filetype=i3config
autocmd BufRead,BufNewFile */fish* set filetype=sh

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Special highlighting
hi DELETE		term=standout	guibg=white	guifg=red	ctermbg=black	ctermfg=red
hi TODO			term=standout	guifg=green	guibg=LightGray ctermbg=green	ctermfg=black
hi NOTE			term=standout	guifg=blue	guibg=white	ctermbg=green	ctermfg=red
hi NEXT			term=standout	guifg=red	guibg=green	ctermbg=blue	ctermfg=red
hi IMPORTANT	term=bold		guibg=red	guifg=white	ctermbg=red		ctermfg=black
hi OPTIONAL		term=bold		guibg=green	guifg=white	ctermbg=green	ctermfg=black
hi Normal		guibg=NONE		ctermbg=NONE
call matchadd('TODO','TODO')
call matchadd('NOTE','NOTE')
call matchadd('NEXT', 'NEXT')
call matchadd('IMPORTANT', 'IMPORTANT')
call matchadd('DELETE', 'DELETE')
call matchadd('OPTIONAL', 'OPTIONAL')

" NERDTree
function! ToggleNERDTree()
	NERDTreeToggle
	silent NERDTreeMirror
endfunction

let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeHijackNetrw=1
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
autocmd StdinReadPre * let s:std_in=1

" Vim Hexokinase
let g:Hexokinase_refreshEvents = ['InsertLeave']
let g:Hexokinase_optInPatterns = ['full_hex', 'triple_hex', 'rgb', 'rgba', 'hsl', 'hsla']
let g:Hexokinase_highlighters = ['backgroundfull']
autocmd BufEnter * HexokinaseTurnOn

" FzF
"let g:fzf_preview_window = 'right:50%'
"let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.9, 'height': 0.9,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
"command! FileHistory execute ":BCommits!"

"command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['--preview', 'preview {}']}, <bang>0)
"command! -bang -nargs=? -complete=dir GFiles call fzf#vim#gitfiles(<q-args>, {'options': ['--preview', 'preview {}']}, <bang>0)
"command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case --color=always --smart-case -- '.shellescape(<q-args>), 1,fzf#vim#with_preview(), <bang>0)

" Load external files
runtime macros.vim
runtime cocrc.vim
runtime start-screen.vim
runtime mappings.vim
