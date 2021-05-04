local gl = require('galaxyline')

local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer', 'startify', 'help', 'ranger'}

local mode_color = {
	n = colors.blue[1],
	i = colors.green[1],
	v = colors.yellow[1],
	[''] = colors.yellow[1],
	V = colors.yellow[1],
	c = colors.red[1],
	no = colors.blue[2],
	s = colors.orange[1],
	S = colors.orange[1],
	[''] = colors.orange[1],
	ic = colors.yellow[1],
	R = colors.red[1],
	Rv = colors.red[1],
	cv = colors.blue[2],
	ce = colors.blue[2],
	r = colors.cyan[1],
	rm = colors.cyan[1],
	['r?'] = colors.cyan[1],
	['!'] = colors.blue[1],
	t = colors.red[2]
}
gls.left[1] = {
	ViMode = {
		provider = function()
			-- auto change color according the vim mode
			vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()])
			return '▊'
		end,
		highlight = {colors.red[2], colors.dark[1]}
	}
}
vim.fn.getbufvar(0, 'ts')

gls.left[2] = {
	BufferIcon = {provider = 'BufferIcon', highlight = {colors.light[1], colors.dark[1]}}
}

gls.left[3] = {
	Permission = {
		provider = function() if vim.bo.readonly then return '' end end,
		separator = ' ',
		separator_highlight = {'NONE', colors.dark[1]},
		highlight = {colors.orange[1], colors.dark[1]}
	}
}

-- gls.left[4] = {
--     GitBranch = {
--         provider = 'GitBranch',
--         condition = condition.check_git_workspace,
-- 				icon = ' ',
--         separator = ' ',
--         separator_highlight = {'NONE', colors.dark[1]},
--         highlight = {colors.light[1], colors.dark[1]}
--     }
-- }
-- gls.left[5] = {
--     DiffAdd = {
--         provider = 'DiffAdd',
--         condition = condition.hide_in_width,
--         icon = ' ',
--         highlight = {colors.green[1], colors.dark[1]}
--     }
-- }
-- gls.left[6] = {
--     DiffModified = {
--         provider = 'DiffModified',
--         condition = condition.hide_in_width,
--         icon = '柳',
--         highlight = {colors.blue[1], colors.dark[1]}
--     }
-- }
-- gls.left[7] = {
--     DiffRemove = {
--         provider = 'DiffRemove',
--         condition = condition.hide_in_width,
--         icon = ' ',
--         highlight = {colors.red[1], colors.dark[1]}
--     }
-- }

gls.right = {
	{
		WordCount = {
			provider = function()
				local content = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), " ")
				local _, words = content:gsub("%S+", "")
				return words .. "W"
			end,
			condition = function() return vim.bo.filetype == '' or vim.bo.filetype == 'text' end,
			separator = ' ',
			separator_highlight = {'NONE', colors.dark[1]},
			highlight = {colors.purple[1], colors.dark[1]}
		}
	},
	{
		DiagnosticError = {
			provider = 'DiagnosticError',
			icon = ' ',
			highlight = {colors.red[2], colors.dark[1]}
		}
	},
	{
		DiagnosticWarn = {
			provider = 'DiagnosticWarn',
			icon = ' ',
			highlight = {colors.orange[2], colors.dark[1]}
		}
	},
	{
		DiagnosticHint = {
			provider = 'DiagnosticHint',
			icon = ' ',
			highlight = {colors.yellow[2], colors.dark[1]}
		}
	},
	{
		DiagnosticInfo = {
			provider = 'DiagnosticInfo',
			icon = ' ',
			highlight = {colors.green[2], colors.dark[1]}
		}
	},
	{
		ShowLspClient = {
			provider = 'GetLspClient',
			-- condition = condition.hide_in_width,
			icon = ' ',
			separator = ' ',
			separator_highlight = {'NONE', colors.dark[1]},
			highlight = {colors.purple[1], colors.dark[1]}
		}
	},
	{
		BufferType = {
			provider = function() return vim.bo.filetype end,
			condition = condition.hide_in_width,
			separator = ' ',
			separator_highlight = {'NONE', colors.dark[1]},
			highlight = {colors.orange[1], colors.dark[1]}
		}
	},
	{
		FileEncode = {
			provider = function() return (vim.bo.fenc ~= '' and vim.bo.fenc or vim.o.enc):upper() end,
			condition = condition.hide_in_width,
			separator = ' ',
			separator_highlight = {'NONE', colors.dark[1]},
			highlight = {colors.yellow[1], colors.dark[1]}
		}
	},
	{
		Tabstop = {
			provider = function() return vim.api.nvim_buf_get_option(0, "shiftwidth") end,
			icon = '_',
			separator = '  ',
			separator_highlight = {'NONE', colors.dark[1]},
			highlight = {colors.green[1], colors.dark[1]}
		}
	},
	{
		LineInfo = {
			provider = function()
				return vim.fn.line('.') .. ':' .. vim.fn.col('.') .. '/' .. vim.fn.line('$')
			end,
			separator = ' ',
			separator_highlight = {'NONE', colors.dark[1]},
			highlight = {colors.cyan[1], colors.dark[1]}
		}
	},
	{
		Percent = {
			provider = function()
				local current_line = vim.fn.line('.')
				local total_line = vim.fn.line('$')
				if current_line == 1 then
					return 'Top'
				elseif current_line == total_line then
					return 'Bot'
				else
					return math.modf((current_line / total_line) * 100) .. '%'
				end
			end,
			separator = ' ',
			separator_highlight = {'NONE', colors.dark[1]},
			highlight = {colors.blue[1], colors.dark[1]}
		}
	}
}
gls.short_line_left[1] = gls.left[1]
gls.short_line_left[2] = {
	BufferType = {
		provider = 'FileTypeName',
		separator = ' ',
		separator_highlight = {'NONE', colors.dark[1]},
		highlight = {colors.light[1], colors.dark[1]}
	}
}

gls.short_line_left[3] = {
	SFileName = {
		provider = 'SFileName',
		condition = condition.buffer_not_empty,
		highlight = {colors.light[1], colors.dark[1]}
	}
}

gls.short_line_right[1] = {
	BufferIcon = {provider = 'BufferIcon', highlight = {colors.light[1], colors.dark[1]}}
}
