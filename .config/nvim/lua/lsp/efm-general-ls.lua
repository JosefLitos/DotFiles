-- Example configuations here: https://github.com/mattn/efm-langserver
-- tsserver/web javascript react, vue, json, html, css, yaml
-- You can look for project scope Prettier and Eslint with e.g. vim.fn.glob("node_modules/.bin/prettier") etc. If it is not found revert to global Prettier where needed.
-- local prettier = {formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}", formatStdin = true}
local tsserver = {
	-- {
	-- formatCommand = "prettier --use-tabs --print-width 100 --stdin-filepath ${INPUT}",
	-- formatStdin = true
	-- },
	{
		lintCommand = "eslint_d -f unix --fix-to-stdout --stdin --stdin-filename ${INPUT}",
		lintIgnoreExitCode = true,
		lintStdin = true,
		lintFormats = {"%f:%l:%c: %m"}
		-- formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
		-- formatStdin = true
	},
	{formatCommand = "prettier --use-tabs --stdin-filepath ${INPUT}", formatStdin = true}
}

require"lspconfig".efm.setup({
	cmd = {DATA_PATH .. "/lspinstall/efm/efm-langserver"},
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = true
		client.resolved_capabilities.goto_definition = false
	end,
	init_options = {documentFormatting = true, codeAction = true},
	filetypes = {
		"lua",
		"python",
		"javascriptreact",
		"javascript",
		"typescript",
		"sh",
		"html",
		"css",
		"json",
		"markdown"
	},
	settings = {
		rootMarkers = {'.git/', 'package.json'},
		languages = {
			python = {
				{
					LintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
					lintStdin = true,
					lintFormats = {"%f:%l:%c: %m"}
				},
				-- {formatCommand = "isort --quiet -", formatStdin = true},
				{formatCommand = "yapf --quiet", formatStdin = true}
				-- {formatCommand = "black --quiet -", formatStdin = true}
			},
			lua = {
				{
					formatCommand = "lua-format -i --column-limit=80 --use-tab --tab-width=2 --indent-width=1 --chop-down-table --no-align-table-field",
					-- formatCommand = "luafmt --stdin -i 2 -l 100 --use-tabs",
					formatStdin = true
				}
			},
			sh = {
				{formatCommand = 'shfmt -ci -s -bn', formatStdin = true},
				{
					LintCommand = 'shellcheck -f gcc -x',
					lintFormats = {'%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'}
				}
			},
			javascript = tsserver,
			javascriptreact = tsserver,
			html = tsserver,
			css = tsserver,
			json = tsserver,
			markdown = {
				{formatCommand = 'pandoc -f markdown -t gfm -sp --tab-stop=2', formatStdin = true} --[[{
    -- TODO default to global lintrc
    -- lintcommand = 'markdownlint -s -c ./markdownlintrc',
    lintCommand = 'markdownlint -s',
    lintStdin = true,
    lintFormats = {'%f:%l %m', '%f:%l:%c %m', '%f: %l: %m'}
}]]
			}
		}
	}
})

