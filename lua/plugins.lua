vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	-- GIT
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")

	-- IDE
	use("lewis6991/gitsigns.nvim")
	use("nvim-treesitter/nvim-treesitter")
	use("kyazdani42/nvim-tree.lua")
	use("windwp/nvim-autopairs")
	use("olimorris/persisted.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("phaazon/hop.nvim")

	-- Language support
	use("ray-x/lsp_signature.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("williamboman/nvim-lsp-installer")

	-- Utils
	use("karb94/neoscroll.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("norcalli/snippets.nvim")
	use("NvChad/nvterm")
	use("sindrets/diffview.nvim")
	use("tpope/vim-commentary")
	use({ "akinsho/bufferline.nvim", tag = "*" })
	use("nvim-lualine/lualine.nvim")
	use("kyazdani42/nvim-web-devicons")

	-- THEMES
	use("sainnhe/everforest")
	use("arcticicestudio/nord-vim")
	use("morhetz/gruvbox")
	use("rakr/vim-one")
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- LSP Config
	use("folke/lsp-colors.nvim")
	use("neovim/nvim-lspconfig")
	use("WhoIsSethDaniel/toggle-lsp-diagnostics.nvim")
	use("glepnir/lspsaga.nvim")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")
	use("onsails/lspkind.nvim")

	-- GO
	use("ray-x/go.nvim")
	use("ray-x/guihua.lua")

	use("groenewege/vim-less")
	use("kchmck/vim-coffee-script")
end)
