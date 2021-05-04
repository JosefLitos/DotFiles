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
	dark = {"#181818", "#2f2d2b"},
	light = {"#827974", "#f9f6e7"},
	purple = {"#b14286", "#ed49a1"},
	red = {"#cc3725", "#fe3921"},
	orange = {"#d2731f", "#fca529"},
	yellow = {"#d79921", "#faed2f"},
	green = {"#669900", "#a5ea11"},
	cyan = {"#458c77", "#60dca8"},
	blue = {"#356588", "#3989e9"}
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
hi('Folded', '#669900', 'NONE', 'term=standout')

hi("Pmenu", colors.light[2], 'NONE')
hi("PmenuSel", colors.dark[1], colors.hi[1])
hi("PmenuSbar", nil, 'NONE')
hi("PmenuThumb", nil, colors.hi[1])
