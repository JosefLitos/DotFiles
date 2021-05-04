-- npm install -g vim-language-server
lsp_setup('vimls', {
	cmd = {DATA_PATH .. "/lspinstall/vim/node_modules/.bin/vim-language-server", "--stdio"},
	settings = {documentFormatting = true}
})
