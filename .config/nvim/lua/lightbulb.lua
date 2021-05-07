require'nvim-lightbulb'.update_lightbulb {
	sign = {
		enabled = true,
		-- Priority of the gutter sign
		priority = 10
	},
	virtual_text = {
		enabled = true,
		-- Text to show at virtual text
		text = "💡"
	}
}
hi('LightBulbVirtualText', colors.light[1])
vim.cmd("autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()")
