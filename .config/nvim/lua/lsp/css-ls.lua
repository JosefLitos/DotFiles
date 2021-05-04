-- npm install -g vscode-css-languageserver-bin
lsp_setup('cssls', {
	cmd = {
		"node",
		DATA_PATH .. "/lspinstall/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
		"--stdio"
	},
	settings = {documentFormatting = true}
})
