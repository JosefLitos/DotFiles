-- npm install -g vscode-html-languageserver-bin
lsp_setup('html', {
	cmd = {
		"node",
		DATA_PATH ..
						"/lspinstall/html/vscode-html/html-language-features/server/dist/node/htmlServerMain.js",
		"--stdio"
	}
})
