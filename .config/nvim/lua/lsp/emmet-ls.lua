local nvim_lsp = require 'lspconfig'
local configs = require 'lspconfig/configs'

configs.emmet_ls = {
	default_config = {
		cmd = {'emmet-ls', '--stdio'},
		filetypes = {'html', 'css'},
		root_dir = require'lspconfig'.util.root_pattern(".git", vim.fn.getcwd())
	}
}

lsp_setup('emmet_ls', {})
