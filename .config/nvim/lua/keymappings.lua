local function mapper(mode, _in, _out, opts, options)
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, _in, _out, options)
end
local function nmap(mode, _in, _out, opts)
	mapper(mode, _in, _out, opts, {noremap = true, silent = true})
end
local function map(mode, _in, _out, opts)
	mapper(mode, _in, _out, opts, {noremap = false, silent = true})
end

nmap('n', '<Space>', '')
vim.g.mapleader = ' '

-- Move selected line / block of text in visual mode
nmap('x', 'K', ':move \'<-2<CR>gv-gv')
nmap('x', 'J', ':move \'>+1<CR>gv-gv')

-- Commenting
nmap("", "<C-S-C>", ":CommentToggle<CR>")
nmap("i", "<C-S-C>", "<Esc>:CommentToggle<CR>a")
map("n", "<M-C>", "gcip")
map("i", "<M-C>", "<Esc>gcipa")

-- Folding
nmap("n", "-", "za")
nmap("i", "<C-S-_>", "<Esc>zcja")
nmap("n", "=", "zi")
nmap("n", "_", "zM")
nmap("n", "+", "zR")

-- Better indenting
nmap('n', '<C-S-lt>', '<<')
nmap('i', '<C-S-lt>', '<C-d>')
nmap('n', '<C-S->>', '>>')
nmap('i', '<C-S->>', '<C-t>')

-- Clipboard management
nmap("n", "<M-x>", "lbdw")
nmap("i", "<M-x>", "<C-o>lbdw")
nmap("n", "<M-X>", "lBdW")
nmap("i", "<M-X>", "<C-o>lBdW")
nmap("n", "<C-x>", "dd")
nmap("v", "<C-x>", "d")
nmap("i", "<C-x>", "<C-o>dd")
nmap("n", "<C-c>", "Y")
nmap("v", "<C-c>", "y")
nmap("i", "<C-c>", "<C-o>Y")
nmap("", "<C-v>", "p")
nmap("i", "<C-v>", "<Esc>pa")
nmap("i", "<C-S-V>", "<Esc>Pa")
nmap("n", "f", "p")
nmap("n", "F", "P")

-- Undotree
nmap("n", "r", ":redo<CR>")
nmap("", "<C-z>", ":undo<CR>")
nmap("i", "<C-z>", "<C-o>:undo<CR>")
nmap("", "<C-y>", ":redo<CR>")
nmap("i", "<C-y>", "<C-o>:redo<CR>")

-- Moving around
nmap("", "<C-g>", "gg")
nmap("i", "<C-g>", "<C-Home>")
nmap("", "<C-S-G>", "G")
nmap("i", "<C-S-G>", "<C-End>")
nmap("n", "K", "{")
nmap("i", "<M-K>", "<C-o>{")
nmap("n", "J", "}")
nmap("i", "<M-J>", "<C-o>}")
nmap("", "<C-h>", "<C-Left>")
nmap("i", "<C-h>", "<C-Left>")
nmap("", "<C-j>", "<PageDown>")
nmap("i", "<C-j>", "<PageDown>")
nmap("", "<C-k>", "<PageUp>")
nmap("i", "<C-k>", "<PageUp>")
nmap("", "<C-l>", "<C-Right>")
nmap("i", "<C-l>", "<C-Right>")
nmap("i", "<M-h>", "<Left>")
nmap("i", "<M-j>", "<Down>")
nmap("i", "<M-k>", "<Up>")
nmap("i", "<M-l>", "<Right>")
-- With arrows
nmap("", "<C-Up>", "<PageUp>")
nmap("i", "<C-Up>", "<PageUp>")
nmap("", "<C-Down>", "<PageDown>")
nmap("i", "<C-Down>", "<PageDown>")
nmap("i", "<S-Left>", "<Left><C-o>v")
nmap("i", "<S-Down>", "<C-o>v<Down>")
nmap("i", "<S-Up>", "<C-o>v<Up>")
nmap("i", "<S-Right>", "<C-o>v")

-- Closing
nmap("", "<C-q>", ":q<CR>")
nmap("i", "<C-q>", "<C-o>:q<CR>")
nmap("", "<C-S-Q>", ":q!<CR>")
nmap("i", "<C-S-Q>", "<C-o>:q!<CR>")
nmap("", "<C-w>", ":BufferClose<CR>")
nmap("i", "<C-w>", "<C-o>:BufferClose<CR>")
nmap("", "<C-S-W>", ":BufferClose!<CR>")
nmap("i", "<C-S-W>", "<C-o>:BufferClose!<CR>")

-- Switching tabs
nmap("n", "<M-S-lt>", ":BufferMovePrevious<CR>")
nmap("n", "<M-S->>", ":BufferMoveNext<CR>")
nmap("", "<M-.>", ":bprevious<CR>")
nmap("i", "<M-.>", "<C-o>:bprevious<CR>")
nmap("", "<M-,>", ":bnext<CR>")
nmap("i", "<M-,>", "<C-o>:bnext<CR>")
nmap("", "<S-Tab>", ":bprevious<CR>")
nmap("", "<Tab>", ":bnext<CR>")
nmap("i", "<C-Tab>", "<C-o>:bnext<CR>")
nmap("", "<M-1>", ":BufferGoto 1<CR>")
nmap("i", "<M-1>", "<C-o>:BufferGoto 1<CR>")
nmap("", "<M-2>", ":BufferGoto 2<CR>")
nmap("i", "<M-2>", "<C-o>:BufferGoto 2<CR>")
nmap("", "<M-3>", ":BufferGoto 3<CR>")
nmap("i", "<M-3>", "<C-o>:BufferGoto 3<CR>")
nmap("", "<M-4>", ":BufferGoto 4<CR>")
nmap("i", "<M-4>", "<C-o>:BufferGoto 4<CR>")
nmap("", "<M-5>", ":BufferGoto 5<CR>")
nmap("i", "<M-5>", "<C-o>:BufferGoto 5<CR>")
nmap("", "<M-6>", ":BufferGoto 6<CR>")
nmap("i", "<M-6>", "<C-o>:BufferGoto 6<CR>")
nmap("", "<M-7>", ":BufferGoto 7<CR>")
nmap("i", "<M-7>", "<C-o>:BufferGoto 7<CR>")
nmap("", "<M-8>", ":BufferGoto 8<CR>")
nmap("i", "<M-8>", "<C-o>:BufferGoto 8<CR>")
nmap("", "<M-9>", ":BufferGoto 9<CR>")
nmap("i", "<M-9>", "<C-o>:BufferGoto 9<CR>")
nmap("n", "<M-p>", ":BufferPick<CR>")
-- Switching splits
nmap("n", "<Leader>v", ":split<CR>")
nmap("n", "<Leader>h", ":vsplit<CR>")
nmap("n", "<C-S-H>", "<C-w>h")
nmap("i", "<C-S-H>", "<C-o><C-w>h")
-- <C-S-J> shows as <C-S-K> and <C-S-K> as <S-NL>
nmap("n", "<C-S-K>", "<C-w>j")
nmap("i", "<C-S-K>", "<C-o><C-w>j")
nmap("n", "<S-NL>", "<C-w>k")
nmap("i", "<S-NL>", "<C-o><C-w>k")
nmap("n", "<C-S-L>", "<C-w>l")
nmap("i", "<C-S-L>", "<C-o><C-w>l")

-- Resize windows
nmap("n", "<M-j>", ":resize -2<CR>")
nmap("n", "<M-k>", ":resize +2<CR>")
nmap("n", "<M-h>", ":vertical resize -2<CR>")
nmap("n", "<M-l>", ":vertical resize +2<CR>")

-- Writing helpers
nmap("n", "<C-r>", ":lua vim.lsp.buf.rename()<CR>")
nmap("i", "<C-r>", "<C-o>:lua vim.lsp.buf.rename()<CR>")
nmap("n", "<F2>", ":lua vim.lsp.buf.rename()<CR>")
nmap("i", "<F2>", "<C-o>:lua vim.lsp.buf.rename()<CR>")
nmap("", "<C-s>", ":w<CR>")
nmap("i", "<C-s>", "<C-o>:w<CR>")
nmap("n", "<M-S-Up>", ":m-2<CR>")
nmap("i", "<M-S-Up>", "<C-o>:m-2<CR>")
nmap("n", "<M-S-Down>", ":m+<CR>")
nmap("i", "<M-S-Down>", "<C-o>:m+<CR>")
nmap("n", "<C-S-Up>", "mdYp`d")
nmap("i", "<C-S-Up>", "<Esc>mdYp`da")
nmap("n", "<C-S-Down>", "mdYP`d")
nmap("i", "<C-S-Down>", "<Esc>mdYP`da")
nmap("i", "<C-S-U>", "<C-v>u")
nmap("i", "<M-C-v>", "<C-v>")
nmap("i", "<M-d>", "<C-v>u2014")
nmap("i", "<C-BS>", "<C-W>")
nmap("i", "<C-S-Del>", "<C-o>ce")
nmap("i", "<M-Enter>", "<C-o>o")
nmap("i", "<M-S-Enter>", "<C-o>O")
nmap("i", "<C-a>", "<C-o><C-a>") -- add value
nmap("i", "<C-d>", "<C-o><C-x>") -- decrease value

-- Exploring
nmap('n', '<Leader>t', ':Telescope<CR>')
nmap('n', '<Leader>f',
     ':Telescope find_files find_command=fd,--search-path,.config,--search-path,./,-E,Android<CR>')
nmap('n', '<Leader>o', ':Telescope oldfiles<CR>')
nmap('n', '<Leader>g', ':Telescope live_grep<CR>')
nmap('n', '<Leader>n', ':enew | Startify<CR>')
nmap('n', '<Leader>e', ":NvimTreeToggle<CR>")
nmap('n', '<Leader>r', ':RnvimrToggle<CR>')
nmap('i', '<C-o>', '<C-o>:RnvimrToggle<CR>')
nmap('n', '<Leader>s', ":Lspsaga open_floaterm<CR>")
nmap('t', '<C-d>', "<C-\\><C-n>:Lspsaga close_floaterm<CR>")
-- LSP bindings
nmap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
nmap('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
nmap('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
nmap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
nmap('n', 'ca', ':Lspsaga code_action<CR>')
nmap('i', '<M-a>', '<C-o>:Lspsaga code_action<CR>')
nmap('n', '<M-i>', ':Lspsaga hover_doc<CR>')
nmap('i', '<M-i>', '<C-o>:Lspsaga hover_doc<CR>')
nmap('n', '<M-I>', ':Lspsaga preview_definition<CR>')
nmap('i', '<M-I>', '<C-o>:Lspsaga preview_definition<CR>')
nmap('i', '<C-S-Space>', '<C-o>:Lspsaga signature_help<CR>')
nmap('n', '<C-p>', ':Lspsaga diagnostic_jump_prev<CR>')
nmap('n', '<C-n>', ':Lspsaga diagnostic_jump_next<CR>')
-- scroll down hover doc or scroll in definition preview
nmap('n', '<C-f>',
     ":lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
-- scroll up hover doc
nmap('n', '<C-b>',
     ":lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")

nmap('i', '<C-Space>', "compe#complete('<C-Space>')", {expr = true})
nmap('i', '<CR>', 'v:lua.autopairs_confirm()', {expr = true})
map("i", "<Tab>", "v:lua.tab_complete('<Tab>')", {expr = true})
map("i", "<S-Tab>", "v:lua.s_tab_complete('<S-Tab>')", {expr = true})
nmap('i', '<C-e>', "compe#close('<C-e>')", {expr = true})
nmap('i', '<Esc>', "compe#close('<Esc>')", {expr = true})
nmap('i', '<C-f>', "compe#scroll({ 'delta': +4 })", {expr = true})
nmap('i', '<C-b>', "compe#scroll({ 'delta': -4 })", {expr = true})
nmap("n", "<M-F>", "v:lua.format_code('n')", {expr = true})
-- nmap("v", "<M-F>", "v:lua.format_code('v')", {expr = true}) -- not working right now
nmap("i", "<M-F>", "v:lua.format_code('i')", {expr = true})

nmap("n", "<F5>", ":e<CR>")
nmap("i", "<F5>", "<C-o>:e<CR>")
nmap("n", "<Leader>l", ":luafile %<CR>")
