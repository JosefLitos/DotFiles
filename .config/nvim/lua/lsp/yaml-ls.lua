-- npm install -g yaml-language-server
lsp_setup('yamlls', {
	cmd = {DATA_PATH .. "/lspinstall/yaml/node_modules/.bin/yaml-language-server", "--stdio"},
	settings = {documentFormatting = true}
})
