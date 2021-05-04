vim.g.rnvimr_enable_ex = 1
vim.g.rnvimr_draw_border = 1
vim.g.rnvimr_enable_picker = 1
vim.g.rnvimr_enable_bw = 1
vim.g.rnvimr_layout = {
	relative = 'editor',
	style = 'minimal',
	width = math.ceil(vim.o.columns * 0.9),
	height = math.ceil(vim.o.lines * 0.9),
	col = math.ceil(vim.o.columns * 0.05),
	row = math.ceil(vim.o.lines * 0.05) - 1
}
