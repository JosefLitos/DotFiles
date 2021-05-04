local autopairs = require('nvim-autopairs')
local rule = require('nvim-autopairs.rule')

-- skip it, if you use another global object
-- vim.g.completion_confirm_key = ""
function _G.autopairs_confirm()
	if vim.fn.pumvisible() ~= 0 then
		if vim.fn.complete_info()["selected"] ~= -1 then
			return vim.fn["compe#confirm"](autopairs.esc("<CR>"))
		else
			return autopairs.esc("<CR>")
		end
	else
		return autopairs.autopairs_cr()
	end
end

autopairs.setup({
	check_ts = true,
	ts_config = {
		lua = {'string'}, -- it will not add pair on that treesitter node
		javascript = {'template_string'},
		java = false -- don't check treesitter on java
	}
})

local ts_conds = require('nvim-autopairs.ts-conds')

-- press % => %% is only inside comment or string
autopairs.add_rules({
	rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({'string', 'comment'})),
	rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({'function'}))
})
-- -- Autocompletion and snippets
-- vim.api.nvim_set_keymap('i', '<CR>', 'v:lua.MUtils.completion_confirm()', {expr = true, noremap = true})
-- -- imap("<CR>", "v:lua.MUtils.completion_confirm()", {expr = true, noremap = true})
-- imap("<Tab>", "v:lua.MUtils.tab()", {expr = true, noremap = true})
-- imap("<S-Tab>", "v:lua.MUtils.s_tab()", {expr = true, noremap = true})

-- skip it, if you use another global object

