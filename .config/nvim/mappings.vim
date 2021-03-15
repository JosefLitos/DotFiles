let mapleader =" "

nnoremap <leader>e :NERDTreeToggle<CR>

" Commenting
noremap <silent> <C-S-C> :Commentary<CR>
inoremap <silent> <C-S-C> <Esc>:Commentary<CR>a
nmap <silent> <M-C> gcap
imap <silent> <M-C> <Esc>gcapa

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

nnoremap <C-c> Y
vnoremap <C-c> y
inoremap <C-c> <Esc>Ya

nnoremap p P
nnoremap f p
nnoremap F P
noremap <C-v> p
inoremap <C-v> <Esc>pa
inoremap <C-S-V> <Esc>Pa

" Moving around
noremap <C-g> gg
inoremap <C-g> <Esc>ggi
inoremap <C-S-G> <Esc>Gi
nnoremap K {
inoremap <M-K> <Esc>{i
nnoremap J }
inoremap <M-J> <Esc>}i
noremap <C-k> <PageUp>
inoremap <C-k> <PageUp>
noremap <C-j> <PageDown>
inoremap <C-j> <PageDown>
noremap <C-h> <C-Left>
inoremap <C-h> <C-Left>
noremap <C-l> <C-Right>
inoremap <C-l> <C-Right>
inoremap <M-h> <Left>
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-l> <Right>

" Use alt + hjkl to resize windows
nnoremap <silent> <M-j> :resize -2<CR>
nnoremap <silent> <M-k> :resize +2<CR>
nnoremap <silent> <M-h> :vertical resize -2<CR>
nnoremap <silent> <M-l> :vertical resize +2<CR>

" Shortcutting split navigation, saving a keypress:
noremap <silent> <C-S-H> <C-w>h
inoremap <silent> <C-S-H> <Esc><C-w>h
" C-S-K is Ctrl+Shift+J; S-NL is Ctrl+Shift+K
noremap <silent> <C-S-K> <C-w>j
inoremap <silent> <C-S-K> <Esc><C-w>j
noremap <silent> <S-NL> <C-w>k
inoremap <silent> <S-NL> <Esc><C-w>k
noremap <silent> <C-S-L> <C-w>l
inoremap <silent> <C-S-L> <Esc><C-w>l

" folding
nnoremap <silent> - za
inoremap <silent> <C-S-_> <Esc>zcji
nnoremap <silent> = zi
nnoremap <silent> _ zM
nnoremap <silent> + zR

" quick writing helpers
inoremap <silent> <C-BS> <C-W>
inoremap <silent> <C-S-Del> <Esc>lce
noremap <silent> <M-F> :Autoformat<CR>
inoremap <silent> <M-F> <Esc>:Autoformat<CR>i
noremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <Esc>:w<CR>a
nnoremap <silent> <M-S-Up> :m-2<CR>
inoremap <silent> <M-S-Up> <Esc>:m-2<CR>a
nnoremap <silent> <M-S-Down> :m+<CR>
inoremap <silent> <M-S-Down> <Esc>:m+<CR>a
nnoremap <silent> <C-S-Up> mdYp`d
inoremap <silent> <C-S-Up> <Esc>mdYp`da
nnoremap <silent> <C-S-Down> mdYP`d
inoremap <silent> <C-S-Down> <Esc>mdYP`da
inoremap <silent> <M-Enter> <Esc>o
inoremap <silent> <M-d> <C-v>u2014
inoremap <C-S-U> <C-v>u
noremap <C-w> <Esc>:q<CR>
inoremap <C-w> <Esc>:q<CR>
noremap <C-S-W> <Esc>:q!<CR>
inoremap <C-S-W> <Esc>:q!<CR>

" Undotree
nnoremap r :redo<CR>
noremap <C-z> :undo<CR>
inoremap <C-z> <Esc>:undo<CR>i
noremap <C-y> :redo<CR>
inoremap <C-y> <Esc>:redo<CR>i

" Remap for rename current word
nnoremap <F2> <Plug>(coc-rename)
inoremap <F2> <Esc><Plug>(coc-rename)
nmap <C-r> <Plug>(coc-rename)
imap <C-r> <Esc><Plug>(coc-rename)

" FzF
nnoremap cc :Commands<CR>
nnoremap <leader>m :Maps<CR>

" for Visual block use Ctrl+Shift+v or Ctrl+q

