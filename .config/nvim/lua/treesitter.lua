require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		"bash",
		"c",
		"comment",
		"cpp",
		"css",
		"html",
		"java",
		"javascript",
		"jsdoc",
		"json",
		"latex",
		"lua",
		"python",
		"regex",
		"rust",
		"typescript",
		"yaml"
	}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ignore_install = {"haskell"},
	highlight = {enable = true},
	-- indent = {enable = true, disable = {"python", "html", "javascript"}},
	-- TODO seems to be broken
	-- indent = {enable = {"javascriptreact"}},
	autotag = {enable = true},
	autopairs = {enable = true},
	rainbow = {enable = false, disable = {"bash"}, extended_mode = true, max_file_lines = 1000}
}

