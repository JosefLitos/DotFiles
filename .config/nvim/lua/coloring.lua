function _G.hi(group, fg, bg, extra)
	if fg then
		fg = string.format(" guifg=%s", fg)
	else
		fg = ''
	end
	if bg then
		bg = string.format(" guibg=%s", bg)
	else
		bg = ''
	end
	if not extra then extra = '' end
	vim.cmd(string.format("hi %s%s%s %s", group, fg, bg, extra))
end

-- Statusline colors
_G.colors = {
	dark =  {"#181818", "#454340"},
	light = {"#9d9c99", "#f0eeec"},
	purple ={"#9d3586", "#f24ccd"},
	red =   {"#cc3725", "#ff4f32"},
	orange ={"#d2731f", "#fca52f"},
	yellow ={"#d59921", "#ffec2c"},
	green = {"#669900", "#9aec00"},
	cyan =  {"#458c77", "#65d7b5"},
	blue =  {"#356088", "#4c88d0"}
}
colors.hi = colors.green

vim.cmd('syntax on') -- enable simple syntax highlighting
-- Colorscheme
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_invert_selection = '1'
vim.g.gruvbox_italic = 1
vim.g.gruvbox_transparent_bg = 1
vim.cmd('colorscheme gruvbox')
hi('Normal', nil, 'NONE')
hi('SignColumn', nil, 'NONE')
hi('Folded', colors.hi[1], 'NONE', 'term=standout')

hi("Pmenu", colors.light[2], 'NONE')
hi("PmenuSel", colors.dark[1], colors.hi[1])
hi("PmenuSbar", nil, 'NONE')
hi("PmenuThumb", nil, colors.hi[1])
