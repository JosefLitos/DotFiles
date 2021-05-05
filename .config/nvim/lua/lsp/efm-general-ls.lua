-- tsserver/web javascript react, vue, json, html, css, yaml
local tsserver = {
	--[[{
		lintCommand = "eslint_d -f unix --fix-to-stdout --stdin --stdin-filename ${INPUT}",
		lintIgnoreExitCode = true,
		lintStdin = true,
		lintFormats = {"%f:%l:%c: %m"}
		-- formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
		-- formatStdin = true
	},]]
	{
		formatCommand = table.concat({
			"prettier --print-width=",
			vim.o.textwidth,
			(vim.o.expandtab or " --use-tabs"),
			" --stdin-filepath ${INPUT}"
		}),
		formatStdin = true
	}
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
				--[[{
					LintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
					lintStdin = true,
					lintFormats = {"%f:%l:%c: %m"}
				},]]
				-- {formatCommand = "isort --quiet -", formatStdin = true},
				{formatCommand = "yapf --quiet", formatStdin = true}
				-- {formatCommand = "black --quiet -", formatStdin = true}
			},
			lua = {
				{
					formatCommand = table.concat({
						"lua-format -i --column-limit=",
						vim.o.textwidth,
						(vim.o.expandtab or " --use-tab"),
						" --tab-width=",
						vim.o.tabstop,
						" --indent-width=",
						(vim.o.expandtab and vim.o.shiftwidth or 1),
						" --chop-down-table --no-align-table-field --no-extra-sep-at-table-end"
					}),
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
				{
					formatCommand = table.concat({
						'pandoc -f markdown -t gfm -s',
						(vim.o.expandtab or 'p'),
						' --tab-stop=4',
						' --columns=',
						vim.o.textwidth
					}),
					formatStdin = true
				} --[[{
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

