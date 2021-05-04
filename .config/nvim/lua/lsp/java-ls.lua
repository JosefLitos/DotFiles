JAVA_LS_EXECUTABLE = 'java-lsp.sh'

-- local bundles = {
--     vim.fn.glob(
--         "~/.config/nvim/.debuggers/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")
-- };

local on_attach = function(client, bufr)
	-- require('jdtls').setup_dap()
	require'lsp'.common_on_attach(client, bufr)
end

require('jdtls').start_or_attach({
	on_attach = on_attach,
	cmd = {JAVA_LS_EXECUTABLE},
	root_dir = require('jdtls.setup').find_root({'build.gradle', 'pom.xml', '.git'})
	-- init_options = {bundles = bundles}
})
