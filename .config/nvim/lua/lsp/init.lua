vim.fn.sign_define("LspDiagnosticsSignError", {
	texthl = "LspDiagnosticsSignError",
	text = "",
	numhl = "LspDiagnosticsSignError"
})
hi('LspDiagnosticsSignError', colors.red[2])
hi('LspDiagnosticsVirtualTextError', colors.red[2], nil, "gui=undercurl")

vim.fn.sign_define("LspDiagnosticsSignWarning", {
	texthl = "LspDiagnosticsSignWarning",
	text = "",
	numhl = "LspDiagnosticsSignWarning"
})
hi('LspDiagnosticsSignWarning', colors.purple[2])
hi('LspDiagnosticsVirtualTextWarning', colors.purple[2], nil, "gui=undercurl")

vim.fn.sign_define("LspDiagnosticsSignHint", {
	texthl = "LspDiagnosticsSignHint",
	text = "",
	numhl = "LspDiagnosticsSignHint"
})
hi('LspDiagnosticsSignHint', colors.light[1])
hi('LspDiagnosticsVirtualTextHint', colors.light[1])

vim.fn.sign_define("LspDiagnosticsSignInformation", {
	texthl = "LspDiagnosticsSignInformation",
	text = "",
	numhl = "LspDiagnosticsSignInformation"
})
hi('LspDiagnosticsSignInformation', colors.green[2])
hi('LspDiagnosticsVirtualTextInformation', colors.green[2])

_G.capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport =
				{properties = {'documentation', 'detail', 'additionalTextEdits'}}

function _G.lsp_setup(server, opts)
	local on_attach = opts.on_attach
	opts.capabilities = capabilities
	opts.on_attach = function(client, bufnr)
		if on_attach then on_attach(client, bufnr) end
		if server ~= 'tailwindls' and server ~= 'sumneko_lua' then
			require'folding'.on_attach()
		end
		client.resolved_capabilities.document_formatting =
						(opts.settings and opts.settings.documentFormatting)
		if client.resolved_capabilities.document_highlight then
			vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
  	  hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
		end
	end
	require("lspconfig")[server].setup(opts)
end

function _G.format_code(mode)
	local options = {
		tabSize = vim.o.tabstop,
		insertSpaces = vim.o.expandtab,
		trimTrailingWhitespace = true,
		insertFinalNewline = true
	}
	if mode == 'v' then
		local x = vim.fn.line('.')
		local y = vim.fn.line('v')
		if x > y then
			local start = y
			local finish = x
		else
			local start = x
			local finish = x
		end
		-- currently not working, idk why
		-- vim.lsp.buf.range_formatting(options, start, finish)
	else
		vim.lsp.buf.formatting(options)
	end
	return ' \b'
end
