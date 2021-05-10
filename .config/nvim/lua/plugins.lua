local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
	local plugin_prefix = vim.fn.stdpath("data") .. "/site/pack/packer/opt/"

	local plugin_path = plugin_prefix .. plugin .. "/"
	--	print('test '..plugin_path)
	local ok, err, code = os.rename(plugin_path, plugin_path)
	if not ok then
		if code == 13 then
			-- Permission denied, but it exists
			return true
		end
	end
	--	print(ok, err, code)
	if ok then vim.cmd("packadd " .. plugin) end
	return ok, err, code
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(function(use)
	-- Packer can manage itself as an optional plugin
	use "wbthomason/packer.nvim"

	-- TODO refactor all of this (for now it works, but yes I know it could be wrapped in a simpler function)
	use {"neovim/nvim-lspconfig", opt = true}
	require_plugin("nvim-lspconfig")
	use {"kabouzeid/nvim-lspinstall", opt = true}
	require_plugin("nvim-lspinstall")
	use {"glepnir/lspsaga.nvim", opt = true}
	require_plugin("lspsaga.nvim")
	-- use 'kosayoda/nvim-lightbulb'
	-- use {"kevinhwang91/nvim-bqf", opt = true}
	-- require_plugin("nvim-bqf")
	-- use "mfussenegger/nvim-jdtls"

	-- Telescope
	use {"nvim-lua/popup.nvim", opt = true}
	require_plugin("popup.nvim")
	use {"nvim-lua/plenary.nvim", opt = true}
	require_plugin("plenary.nvim")
	use {"nvim-telescope/telescope.nvim", opt = true}
	require_plugin("telescope.nvim")

	-- Debugging
	-- use {"mfussenegger/nvim-dap", opt = true}
	-- require_plugin("nvim-dap")

	-- Autocomplete
	use {"hrsh7th/nvim-compe", opt = true}
	require_plugin("nvim-compe")
	use {"hrsh7th/vim-vsnip", opt = true}
	require_plugin("vim-vsnip")
	use "hrsh7th/vim-vsnip-integ"
	-- use {"rafamadriz/friendly-snippets", opt = true}
	
	-- Formatting
	use 'pierreglaser/folding-nvim'
	use 'terrortylor/nvim-comment'

	-- Treesitter
	use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
	require_plugin("nvim-treesitter")
	use {"windwp/nvim-autopairs", opt = true}
	require_plugin("nvim-autopairs")
	-- use {"p00f/nvim-ts-rainbow", opt = true}
	-- require_plugin("nvim-ts-rainbow")
	use {"windwp/nvim-ts-autotag", opt = true}
	require_plugin("nvim-ts-autotag")

	-- Explorer
	use "kyazdani42/nvim-tree.lua"
	require_plugin("nvim-tree.lua")
	use "kevinhwang91/rnvimr"

	-- Color
	--use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
	use {'rrethy/vim-hexokinase', run = 'make hexokinase'}
	use 'JosefLitos/nvim-i3config'

	-- Icons
	use 'kyazdani42/nvim-web-devicons'
	-- use 'lewis6991/gitsigns.nvim'

	-- Status Line and Bufferline
	use 'mhinz/vim-startify'
	use 'glepnir/galaxyline.nvim'
	use {"romgrk/barbar.nvim", opt = true}
	require_plugin("barbar.nvim")
end)
