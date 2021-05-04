-- npm i -g bash-language-server
lsp_setup('bashls', {
	cmd = {DATA_PATH .. "/lspinstall/bash/node_modules/.bin/bash-language-server", "start"},
	filetypes = {"sh", "zsh"}
})
