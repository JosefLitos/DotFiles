let mapleader =" "

nnoremap <leader>e :NERDTreeToggle<CR>

" Commenting
noremap <silent> <C-S-C> :Commentary<CR>
inoremap <silent> <C-S-C> <Esc>:Commentary<CR>a
nmap <silent> <M-C> gcap
imap <silent> <M-C> <Esc>gcapa

" for unicode chars
inoremap <M-d> <C-v>u2014
inoremap <C-U> <C-v>u

inoremap <M-Enter> <Esc>o

" Fix indenting visual block
nnoremap <C-S-lt> <<
nnoremap <C-S->> >>
inoremap <C-S-lt> <C-d>
inoremap <C-S->> <C-t>
vnoremap < <gv
vnoremap > >gv

nnoremap sn :enew \| Startify <CR>

" clipboard management
nnoremap <M-x> lbdw
inoremap <M-x> <Esc>lbdwi
nnoremap <M-X> lBdW
inoremap <M-X> <Esc>lBdWi
nnoremap <C-x> dd
vnoremap <C-x> d
inoremap <C-x> <Esc>ddi

nnoremap <C-c> yy
vnoremap <C-c> y
inoremap <C-c> <Esc>yya

nnoremap p P
nnoremap f p
nnoremap F P
inoremap <C-v> <Esc>pa

" Moving around
noremap <C-g> gg
inoremap <C-g> <Esc>ggi
nnoremap K {
nnoremap J }
noremap <C-k> <PageUp>
inoremap <C-k> <PageUp>
noremap <C-j> <PageDown>
inoremap <C-j> <PageDown>

" Use alt + hjkl to resize windows
nnoremap <silent> <M-j> :resize -2<CR>
nnoremap <silent> <M-k> :resize +2<CR>
nnoremap <silent> <M-h> :vertical resize -2<CR>
nnoremap <silent> <M-l> :vertical resize +2<CR>

" Shortcutting split navigation, saving a keypress:
noremap <C-h> <C-w>h
noremap <C-Down> <C-w>j
noremap <C-Up> <C-w>k
noremap <C-l> <C-w>l

" quick writings
nnoremap - za
nnoremap = zi
nnoremap _ zM
nnoremap + zR
noremap <M-F> :Autoformat<CR>
inoremap <M-F> <Esc>:Autoformat<CR>i
noremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
nnoremap <M-s> i<silent> <Esc><C-Left>
inoremap <M-s> <silent> <Esc><C-Left>

" Undotree
nnoremap r :redo<CR>
noremap <C-z> :undo<CR>
noremap <C-y> :redo<CR>

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)
nmap <C-R> <Plug>(coc-rename)

" FzF
nnoremap cc :Commands<CR>
nnoremap <leader>m :Maps<CR>
