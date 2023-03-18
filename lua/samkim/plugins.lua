local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- core plugins
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	-- utility plugins
	use("yuttie/comfortable-motion.vim")
	use("romainl/vim-cool") -- Disables highlights on searches
	use("tpope/vim-commentary")
	use("ggandor/lightspeed.nvim")
	use("windwp/nvim-autopairs")
	use("kyazdani42/nvim-web-devicons")
	use({ "kyazdani42/nvim-tree.lua", commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243" })
	use("Yggdroot/indentLine")
	use("pechorin/any-jump.vim")
	use("tpope/vim-surround")
	use("voldikss/vim-floaterm")
	use("vim-scripts/repmo.vim")
	use("wfxr/minimap.vim")

	-- telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use("BurntSushi/ripgrep")

	-- color schemes
	use("dracula/vim")
	use("AlexvZyl/nordic.nvim")
	use("junegunn/seoul256.vim")
	use("folke/tokyonight.nvim")
	use("navarasu/onedark.nvim")
	use("EdenEast/nightfox.nvim")
	use({
		"neanias/everforest-nvim",
		config = function()
			require("everforest").setup()
		end,
	})
	use("projekt0n/github-nvim-theme")
	use("morhetz/gruvbox")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use({
		"saecki/crates.nvim",
		tag = "v0.2.1",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
	})
	use({
		"David-Kunz/cmp-npm",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	})
	use("jose-elias-alvarez/null-ls.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		-- commit = "5d11dfc27849e3d7435c32dbd8ea9be35bcd990b",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- airline
	use("vim-airline/vim-airline-themes")
	use("vim-airline/vim-airline")

	-- rust
	use("rust-lang/rust.vim")
	use("simrat39/rust-tools.nvim")

	-- latex
	use("lervag/vimtex")

	-- solidity
	use("tomlion/vim-solidity")

	-- kitty
	use("fladson/vim-kitty")

	-- git
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})
	use("tpope/vim-fugitive")

	-- web development
	use("pangloss/vim-javascript")
	use("mxw/vim-jsx")
	use("leafgarland/typescript-vim")
	use("peitalin/vim-jsx-typescript")
	use("styled-components/vim-styled-components")
	use("jparise/vim-graphql")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
