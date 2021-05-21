vim.cmd('syntax on') -- enable simple syntax highlighting

function _G.hi(group, fg, bg, extra)
	if fg then
		fg = " guifg=" .. fg
	else
		fg = ''
	end
	if bg then
		bg = " guibg=" .. bg
	else
		bg = ''
	end
	if not extra then extra = '' end
	vim.cmd(string.format("hi %s%s%s %s", group, fg, bg, extra))
end

-- -- Colorscheme
-- vim.g.gruvbox_contrast_dark = 'hard'
-- vim.g.gruvbox_invert_selection = '1'
-- vim.g.gruvbox_italic = 1
-- vim.g.gruvbox_transparent_bg = 1
-- -- vim.cmd('colorscheme gruvbox')

-- my colors
_G.colors = {
	dark =   {"#222222", "#4a4846"},
	light =  {"#868380", "#f0ece0"},
	violet = {"#9040a8", "#b555f0"},
	magenta ={"#9d2098", "#d032c5"},
	pink =   {"#bd5878", "#f09aa5"},
	red =    {"#c82a15", "#f03522"},
	orange = {"#d26d15", "#f08522"},
	yellow = {"#d8af15", "#f0e522"},
	lime =   {"#90aa15", "#bcf022"},
	green =  {"#559915", "#85f022"},
	cyan =   {"#45ac87", "#75f0aa"},
	blue =   {"#1a6ab8", "#2798f0"}
}
colors.hi = colors.green --highlight
colors.con = colors.magenta --contrast
hi('Black', colors.dark[1])
hi('Grey', colors.dark[2])
hi('LightGrey', colors.light[1])
hi('White', colors.light[2])
hi('Violet', colors.violet[1])
hi('LightViolet', colors.violet[2])
hi('Magenta', colors.magenta[1])
hi('LightMagenta', colors.magenta[2])
hi('Pink', colors.pink[1])
hi('LightPink', colors.pink[2])
hi('Red', colors.red[1])
hi('LightRed', colors.red[2])
hi('Orange', colors.orange[1])
hi('LightOrange', colors.orange[2])
hi('Yellow', colors.yellow[1])
hi('LightYellow', colors.yellow[2])
hi('Lime', colors.lime[1])
hi('LightLime', colors.lime[2])
hi('Green', colors.green[1])
hi('LightGreen', colors.green[2])
hi('Cyan', colors.cyan[1])
hi('LightCyan', colors.cyan[2])
hi('Blue', colors.blue[1])
hi('LightBlue', colors.blue[2])
hi('Highlight', colors.hi[1])
hi('LightHighlight', colors.hi[2])
hi('Contrast', colors.con[1])
hi('LightContrast', colors.con[2])

-- vim.g.terminal_color_0 = nil
-- vim.g.terminal_color_1 = nil
-- vim.g.terminal_color_2 = nil
-- vim.g.terminal_color_3 = nil
-- vim.g.terminal_color_4 = nil
-- vim.g.terminal_color_5 = nil
-- vim.g.terminal_color_6 = nil
-- vim.g.terminal_color_7 = nil
-- vim.g.terminal_color_8 = nil
-- vim.g.terminal_color_9 = colors.red[2]
-- vim.g.terminal_color_10 = nil
-- vim.g.terminal_color_11 = nil
-- vim.g.terminal_color_12 = nil
-- vim.g.terminal_color_13 = nil
-- vim.g.terminal_color_14 = nil
-- vim.g.terminal_color_15 = nil

hi('Pmenu', colors.light[2], 'NONE')
hi('PmenuSel', colors.dark[1], colors.hi[1])
hi('PmenuSbar', nil, 'NONE')
hi('PmenuThumb', nil, colors.hi[1])

hi('Normal', colors.light[2], 'NONE')
hi('Title', colors.hi[2], nil, 'gui=bold')
hi('Search', colors.dark[1], colors.yellow[1], 'gui=bold')
hi('IncSearch', colors.dark[1], colors.orange[1], 'gui=bold')
hi('Visual', nil, colors.dark[1], 'gui=reverse')
hi('SignColumn', colors.dark[2], 'NONE')
hi('FoldColumn', colors.dark[2], 'NONE')
hi('Folded', colors.hi[1], colors.dark[1], 'term=standout')
hi('CursorColumn', nil, colors.dark[1])
hi('CursorLine', nil, colors.dark[1])
hi('CursorLineNR', colors.light[1], colors.dark[1], 'gui=NONE')
hi('ColorColumn', nil, colors.dark[1])
hi('Comment', colors.light[1], nil, 'gui=italic')
hi('MatchParen', colors.yellow[2], colors.dark[2], 'gui=bold')
hi('VertSplit', colors.light[1], colors.dark[1], 'gui=NONE')
hi('StatusLineNC', colors.dark[1], colors.light[1])
hi('ErrorMsg', colors.red[2], 'NONE', 'gui=bold')
hi('WarningMsg', colors.orange[2], 'NONE', 'gui=bold')
hi('Question', colors.yellow[2], 'NONE', 'gui=bold')
hi('Error', colors.dark[1], colors.red[2], 'gui=bold,underline')
hi('Todo', colors.dark[1], colors.magenta[2], 'gui=bold,underline')
hi('DiffAdd', colors.dark[1], colors.green[1], 'gui=NONE')
hi('DiffChange', colors.dark[1], colors.cyan[1], 'gui=NONE')
hi('DiffDelete', colors.dark[1], colors.red[1], 'gui=NONE')
hi('DiffText', colors.dark[1], colors.yellow[1], 'gui=NONE')
vim.cmd([[
hi! link LineNr Grey
hi! link StatusLine LightGrey 
hi! link NonText Grey
hi! link SpecialKey NonText
hi! link Type Normal
hi! link Special Keyword
hi! link SpecialChar Orange
hi! link Delimiter LightRed
hi! link Operator Red
hi! link Statement Keyword
hi! link PreProc Cyan
hi! link Command LightBlue
hi! link Keyword Blue
hi! link Define PreProc
hi! link Conditional Command
hi! link Repeat Command
hi! link Include Keyword
hi! link Method Delimiter
hi! link Function LightCyan
hi! link String Yellow
hi! link Character LightYellow
hi! link Number LightPink
hi! link Boolean Keyword
hi! link Constant LightViolet
hi! link Identifier Normal
hi! link Variable Green
hi! link Field LightGreen
hi! link TSField Field
hi! link TSVariable Variable
hi! link TSMath Number
hi! link TSConstructor Method
hi! link TSParameter Lime
hi! link TSKeywordOperator Keyword
hi! link commentTSConstant Magenta
]])

-- NvimTree
hi('NvimTreeExecFile', colors.green[2], nil, "gui=bold")
hi('Directory', colors.green[1], nil, "gui=bold")
hi('NvimTreeSymlink', colors.cyan[1], nil, "gui=bold")
hi('NvimTreeSpecialFile', colors.pink[1], nil, "gui=bold")
hi('NvimTreeOpenedFile', colors.violet[1], nil, "gui=bold")
vim.cmd([[
hi! link NvimTreeIndentMarker Magenta
hi! link NvimTreeImageFile Yellow
hi! link NvimTreeGitDirty DiffDelete
hi! link NvimTreeGitDeleted DiffDelete
hi! link NvimTreeGitMerge DiffChange
hi! link NvimTreeGitRenamed DiffChange
hi! link NvimTreeGitStaged DiffAdd
hi! link NvimTreeGitNew DiffAdd
hi! link NvimTreeRootFolder LightMagenta
hi! link NvimTreeFolderIcon Green
]])

-- Startify
vim.cmd([[
hi! link StartifyHeader LightContrast
hi! link StartifySection LightHighlight
hi! link StartifyBracket Grey
hi! link StartifyNumber Red
hi! link StartifySpecial Black
hi! link StartifyFooter Black
hi! link StartifyPath LightGrey
hi! link StartifySlash LightGrey
hi! link StartifyFile White
]])

-- BufferLine
vim.cmd([[
hi! link BufferVisible White
hi! link BufferVisibleMod LightOrange
hi! link BufferVisibleSign LightContrast
hi! link BufferCurrent White
hi! link BufferCurrentMod LightRed
hi! link BufferCurrentSign LightHighlight
hi! link BufferInactive LightGrey
hi! link BufferInactiveMod Orange
hi! link BufferInactiveSign LightGrey
]])

-- Lsp
hi('LspDiagnosticsVirtualTextError', colors.red[2], nil, "gui=undercurl")
hi('LspDiagnosticsVirtualTextWarning', colors.violet[2], nil, "gui=undercurl")
vim.cmd([[
hi! link LspDiagnosticsDefaultError LightRed
hi! link LspDiagnosticsDefaultWarning LightViolet
hi! link LspDiagnosticsDefaultHint LightGrey
hi! link LspDiagnosticsDefaultInformation LightGreen
hi! link LspSagaFinderSelection LightGreen
hi! link LspFloatWinBorder Contrast
]])

-- Git
vim.cmd([[
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffDiffer DiffChange
hi! link diffBDiffer diffDiffer
hi! link diffRemoved DiffRemove
hi! link gitcommitSummary Title
hi! link gitcommitHeader Title
]])
