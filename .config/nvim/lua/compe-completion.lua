-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
	"  ", -- Text
	"  ", -- Method
	"  ", -- Function
	"  ", -- Constructor
	"  ", -- Field
	"  ", -- Variable
	" ﰮ ", -- Class
	"  ", -- Interface
	"  ", -- Module
	" 襁", -- Property
	"  ", -- Unit
	"  ", -- Value
	" 練", -- Enum
	"  ", -- Keyword
	"  ", -- Snippet
	"  ", -- Color
	"  ", -- File
	"  ", -- Reference
	"  ", -- Folder
	"  ", -- EnumMember
	" ﲀ ", -- Constant
	" ﳤ ", -- Struct
	"  ", -- Event
	"  ", -- Operator
	"  " -- TypeParameter
}

vim.o.completeopt = 'menuone,noselect'
-- vim.g.loaded_compe_emoji = true
require'compe'.setup {
	enabled = true,
	min_length = 2,
	preselect = 'enable',
	throttle_time = 200,
	source_timeout = 200,
	incomplete_delay = 400,
	-- max_abbr_width = 100,
	-- max_kind_width = 100,
	-- max_menu_width = 100,

	source = {
		path = {kind = " פּ "},
		buffer = {kind = "  ", menu = "[Buf]"},
		calc = {kind = "  "},
		vsnip = {kind = "  "},
		nvim_lsp = true,
		nvim_lua = {kind = "  "},
		-- spell = {menu = "  "},
		-- tags = {kind = "  "},
		-- vim_dadbod_completion = true,
		-- snippets_nvim = {kind = "  "},
		-- ultisnips = {kind = "  "},
		treesitter = {kind = "  "},
		emoji = {menu = " ﲃ", filetypes = {"markdown", "text"}}
		-- for emoji press :
	}
}
vim.cmd("hi link CompeDocumentation Pmenu")

local function t(str) return vim.api.nvim_replace_termcodes(str, true, true, true) end

local function check_back_space()
	local col = vim.fn.col('.') - 1
	return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
function _G.tab_complete(fallback)
	if vim.fn.pumvisible() == 1 then
		return t "<C-n>"
	elseif vim.fn.call("vsnip#available", {1}) == 1 then
		return t "<Plug>(vsnip-expand-or-jump)"
	elseif check_back_space() then
		return t(fallback)
	else
		return vim.fn['compe#complete'](fallback)
	end
end
function _G.s_tab_complete(fallback)
	if vim.fn.pumvisible() == 1 then
		return t "<C-p>"
	elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
		return t "<Plug>(vsnip-jump-prev)"
	else
		return t(fallback)
	end
end
