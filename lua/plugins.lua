vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	use("wbthomason/packer.nvim")
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
	use("roxma/nvim-yarp")

	-- Utils
	use("karb94/neoscroll.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("norcalli/snippets.nvim")
	use("NvChad/nvterm")
	use("sindrets/diffview.nvim")
	use("tpope/vim-commentary")
	use("github/copilot.vim")
	use({ "akinsho/bufferline.nvim", tag = "*" })

	-- Installers
	use("ncm2/ncm2")
	use("ncm2/ncm2-jedi")
	use("ncm2/ncm2-path")
	use("williamboman/nvim-lsp-installer")

	-- THEMES
	use("sainnhe/everforest")
	use("kyazdani42/nvim-web-devicons")
	use("nvim-lualine/lualine.nvim")
	use("arcticicestudio/nord-vim")
	use("morhetz/gruvbox")
	use("cocopon/iceberg.vim")
	use("lifepillar/vim-solarized8")
	use("svrana/neosolarized.nvim")
	use("tjdevries/colorbuddy.nvim")
	use("chriskempson/base16-vim")
	use("mhartington/oceanic-next")
	use("EdenEast/nightfox.nvim")
	use({ "kaicataldo/material.vim", branch = "main" })
	use("kristijanhusak/vim-hybrid-material")
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

	use("groenewege/vim-less")
	use("kchmck/vim-coffee-script")
end)
