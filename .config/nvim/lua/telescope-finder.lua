local actions = require('telescope.actions')
-- Global remapping
------------------------------
-- '--color=never',
require('telescope').setup {
	defaults = {
		find_command = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case'
		},
		prompt_position = "bottom",
		prompt_prefix = " ",
		selection_caret = " ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_defaults = {horizontal = {mirror = false}, vertical = {mirror = false}},
		file_sorter = require'telescope.sorters'.get_fuzzy_file,
		file_ignore_patterns = {},
		generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
		shorten_path = true,
		winblend = 0,
		width = 0.75,
		preview_cutoff = 120,
		results_height = 1,
		results_width = 0.8,
		border = {},
		borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
		color_devicons = true,
		use_less = true,
		set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
		file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
		grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
		qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
				-- To disable a keymap, put [map] = false
				["<Esc>"] = actions.close,
				-- Add up multiple actions
				["<CR>"] = actions.select_default + actions.center
			},
			n = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
			}
		}
	}
}

vim.cmd('hi link TelescopeNormal Pmenu')
hi('TelescopeSelection', colors.hi[2], colors.dark[2], 'gui=bold')
vim.cmd('hi link TelescopeMultiSelection PmenuSel')
hi('TelescopeMatching', colors.orange[2])
hi('TelescopePromptPrefix', colors.hi[2])
