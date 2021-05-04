-- Check if tailwindls server already defined.
-- if not require'lspconfig'.tailwindls then
require'lspconfig/configs'['tailwindls'] = {default_config = {}}
-- end

lsp_setup('tailwindls', {
	cmd = {
		"node",
		DATA_PATH .. "/lspinstall/tailwindcss/tailwindcss-intellisense/extension/dist/server/index.js",
		"--stdio"
	},
	filetypes = {
		'html',
		'css',
		'scss',
		'javascript',
		'javascriptreact',
		'typescript',
		'typescriptreact'
	},
	root_dir = require('lspconfig/util').root_pattern("package.json", "tsconfig.json", "jsconfig.json",
                                                  	".git"),
	handlers = {
		["tailwindcss/getConfiguration"] = function(_, _, params, _, bufnr, _)
			-- tailwindcss lang server waits for this repsonse before providing hover
			vim.lsp.buf_notify(bufnr, "tailwindcss/getConfigurationResponse", {_id = params._id})
		end
	}
})
