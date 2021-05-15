--[[ -- Currently global settings not used when directly entering a file
vim.o.textwidth = 100
vim.o.expandtab = false -- Convert tabs to spaces
vim.o.tabstop = 2 -- Tab size in spaces
vim.o.shiftwidth = 2 -- Spaces inserted for a tab
vim.o.softtabstop = 2 -- Spaces inserted for a tab
vim.o.wrap = true
vim.o.undofile = true
vim.o.swapfile = false
vim.o.colorcolumn = "0" -- fix indentline for now
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.number = true -- set numbered lines
vim.o.relativenumber = false -- relative to current line
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.foldmethod = 'indent'
vim.o.foldnestmax = 1
vim.o.foldcolumn = '0' -- width of fold tree column
vim.o.foldlevel = 100
vim.o.foldenable = true
]]--[[
vim.bo.textwidth = 100
vim.bo.expandtab = false -- Convert tabs to spaces
vim.bo.tabstop = 2 -- Tab size in spaces
vim.bo.shiftwidth = 2 -- Spaces inserted for a tab
vim.bo.softtabstop = 2 -- Spaces inserted for a tab
vim.wo.wrap = true
vim.bo.undofile = true
vim.bo.swapfile = false
vim.wo.colorcolumn = "0" -- fix indentline for now
vim.wo.cursorline = true
vim.wo.cursorcolumn = true
vim.wo.number = true -- set numbered lines
vim.wo.relativenumber = false -- relative to current line
vim.wo.linebreak = true
vim.wo.breakindent = true
vim.bo.autoindent = true
vim.bo.smartindent = true
vim.wo.foldmethod = 'indent'
vim.wo.foldnestmax = 1
vim.wo.foldcolumn = '0' -- width of fold tree column
vim.wo.foldlevel = 100
vim.wo.foldenable = true
]]
vim.cmd([[
set tw=100 noet ts=2 sw=2 sts=2
set wrap undofile noswapfile
set cc=0 cul cuc nu nornu
set lbr bri ai si fdm=indent fdn=1 fdc=0 fdl=100 nofen
]])
vim.o.signcolumn = "no" -- Always show the signcolumn
vim.cmd('set iskeyword+=- shortmess+=ca formatoptions-=cro')
vim.o.incsearch = true
-- TERMINAL = vim.fn.expand('$TERMINAL')
-- vim.cmd('let &titleold="' .. TERMINAL .. '"')
vim.o.title = true
vim.o.titlestring = "%{expand('%:t')} - NVim"
vim.o.fileencoding = "utf-8" -- The encoding written to file
vim.o.encoding = 'utf-8'
vim.o.mouse = "a" -- Enable mouse
vim.o.clipboard = "unnamedplus" -- Enable clipboard
vim.o.termguicolors = true -- use gui, not cterm
vim.o.showtabline = 2 -- Always show buffers
vim.o.hidden = true -- Keep multiple buffers in memory
vim.o.showmode = false
vim.cmd('set whichwrap+=<,>,[,],h,l') -- move to next line with thes
vim.o.cmdheight = 1 -- More space for displaying messages
vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.backup = false
vim.o.writebackup = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.smarttab = true
vim.o.updatetime = 300 -- Faster completion
vim.o.timeoutlen = 500 -- By default timeoutlen is 1000 ms
-- vim.o.conceallevel = 0
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')
require'nvim_comment'.setup()
