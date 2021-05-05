local utils = require('utils')

utils.define_augroups({
	_general_settings = {
		{
			'TextYankPost',
			'*',
			'lua require(\'vim.highlight\').on_yank({higroup = \'Search\', timeout = 200})'
		}
	},
	_java = {
		{'FileType', 'java', [[lua require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}})]]},
		{'FileType', 'java', 'nnoremap ca <Cmd>lua require(\'jdtls\').code_action()<CR>'}
	},
	_markdown = {{'FileType', 'markdown', 'setlocal spell ts=4 sw=4'}},
	--[[_solidity = {
		{'BufWinEnter', '.sol', 'setlocal filetype=solidity'},
		{'BufRead', '*.sol', 'setlocal filetype=solidity'},
		{'BufNewFile', '*.sol', 'setlocal filetype=solidity'}
	},
	_gemini = {
		{'BufWinEnter', '.gmi', 'setlocal filetype=markdown'},
		{'BufRead', '*.gmi', 'setlocal filetype=markdown'},
		{'BufNewFile', '*.gmi', 'setlocal filetype=markdown'}
	},]]
	_buffer_bindings = {
		{'FileType', 'lspinfo', 'nnoremap <silent> <buffer> q :q<CR>'},
		{'FileType', 'text', 'imap <silent> <expr> <buffer> <Enter> v:lua.enter_or_list()'}
	}

	-- _auto_formatters = {
	-- 	{
	-- 		'BufWritePre',
	-- 		'*.py,*.js,*.jsx,*.css,*.html,*.json,*.yaml,*.lua',
	-- 		'lua vim.lsp.buf.formatting_sync(nil, 1000)'
	-- 	}
	-- }

})

-- Filetype presets
utils.commands([[
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man setlocal filetype=groff
	autocmd BufRead,BufNewFile *.tex setlocal filetype=tex
	autocmd BufRead,BufNewFile *config,*.conf setlocal filetype=config
	autocmd BufRead,BufNewFile *fontconfig/* setlocal filetype=xml
	autocmd BufRead,BufNewFile */i3/*conf* setlocal filetype=i3config
	autocmd BufRead,BufNewFile */X11/xorg* setlocal filetype=xf86conf
	autocmd BufRead,BufNewFile */fish* setlocal filetype=sh
	autocmd FileType text setlocal nonumber signcolumn=no nocursorline nocursorcolumn spell
]])
