-- If you are using rvm, make sure to change below configuration
lsp_setup('solargraph', {
	cmd = {DATA_PATH .. "~/.rbenv/shims/solargraph", "--stdio"},
	handlers = {
		["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = true

		})
	}
})
