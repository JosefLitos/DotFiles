-- :-- npm install -g typescript typescript-language-server
-- require'snippets'.use_suggested_mappings()
-- local on_attach_common = function(client)
-- print("LSP Initialized")
-- require'completion'.on_attach(client)
-- require'illuminate'.on_attach(client)
-- end
lsp_setup('tsserver', {
	cmd = {
		DATA_PATH .. "/lspinstall/typescript/node_modules/.bin/typescript-language-server",
		"--stdio"
	},
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx"
	},
	-- This makes sure tsserver is not used for formatting (I prefer prettier)
	-- on_attach = require'lsp'.common_on_attach,
	root_dir = require('lspconfig/util').root_pattern("package.json", "tsconfig.json", "jsconfig.json",
                                                  	".git"),
	handlers = {
		["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = true
		})
	},
	init_options = {suggestFromUnimportedLibraries = true, closingLabels = true}
})
