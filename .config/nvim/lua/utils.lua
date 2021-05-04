local utils = {}

function utils.define_augroups(definitions) -- {{{1
	-- Create autocommand groups based on the passed definitions
	--
	-- The key will be the name of the group, and each definition
	-- within the group should have:
	--    1. Trigger
	--    2. Pattern
	--    3. Text
	-- just like how they would normally be defined from Vim itself
	for group_name, definition in pairs(definitions) do
		vim.cmd('augroup ' .. group_name)
		vim.cmd('autocmd!')

		for _, def in pairs(definition) do
			local command = table.concat(vim.tbl_flatten {'autocmd', def}, ' ')
			vim.cmd(command)
		end

		vim.cmd('augroup END')
	end
end

function utils.commands(commands)
	for command in commands:gmatch("([^\n]*)\n?") do vim.cmd(command) end
end

-- lsp

function utils.add_to_workspace_folder() vim.lsp.buf.add_workspace_folder() end

function utils.declaration()
	vim.lsp.buf.declaration()
	vim.lsp.buf.clear_references()
end

function utils.definition()
	vim.lsp.buf.definition()
	vim.lsp.buf.clear_references()
end
function utils.references()
	vim.lsp.buf.references()
	vim.lsp.buf.clear_references()
end

-- misc
function utils.file_exists(name)
	local f = io.open(name, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

function _G.enter_or_list()
	local line =
					vim.api.nvim_buf_get_lines(0, vim.fn.line('.') - 1, -1, false)[1]:match('^%s*[^%a%s]+')
	if not line then
		return '\r'
	else
		local start, finish = line:find('[^%a%s]*%d')
		local main = line:sub(start, finish)
		local suffix = line:sub(finish + 1)
		return table.concat({
			'\r',
			main,
			vim.api.nvim_replace_termcodes('<Esc><C-a>a', true, true, true),
			suffix,
			' '
		})
	end
	-- return vim.api.nvim_replace_termcodes(line:match('^%s*%d.*') and'<CR><Esc>kk<End>Ev<Home>yjpk<End>e<C-a><End>a<Space>' or '<CR>',true,true,true)
end

return utils

