local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	-- GIT
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",

	-- IDE
	"lewis6991/gitsigns.nvim",
	"nvim-treesitter/nvim-treesitter",
	"kyazdani42/nvim-tree.lua",
	"windwp/nvim-ts-autotag",
	"windwp/nvim-autopairs",
	"olimorris/persisted.nvim",
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl" },
	{ "folke/flash.nvim", event = "VeryLazy" },
	"rcarriga/nvim-notify",
	"kevinhwang91/nvim-ufo",
	"kevinhwang91/promise-async",
	-- "github/copilot.vim",
	"David-Kunz/gen.nvim",

	-- Language support
	"ray-x/lsp_signature.nvim",
	"nvimtools/none-ls.nvim",
	"williamboman/nvim-lsp-installer",

	-- Utils
	{ "nvim-neotest/nvim-nio" },
	"karb94/neoscroll.nvim",
	"nvim-telescope/telescope.nvim",
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	"norcalli/snippets.nvim",
	"NvChad/nvterm",
	"sindrets/diffview.nvim",
	"tpope/vim-commentary",
	{ "akinsho/bufferline.nvim", version = "*" },
	"nvim-lualine/lualine.nvim",
	"nvim-tree/nvim-web-devicons",
	"MunifTanjim/nui.nvim",
	{ "folke/noice.nvim", event = "VeryLazy" },
	"xiyaowong/transparent.nvim",
	"smjonas/inc-rename.nvim",

	-- THEMES
	{ "catppuccin/nvim", as = "catppuccin" },

	-- LSP Config
	"folke/lsp-colors.nvim",
	"neovim/nvim-lspconfig",
	"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
	"glepnir/lspsaga.nvim",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"saadparwaiz1/cmp_luasnip",
	-- "L3MON4D3/LuaSnip",
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
	},
	"onsails/lspkind.nvim",
	"ray-x/guihua.lua",

	-- GO
	"ray-x/go.nvim",

	-- DEBUGGER
	"leoluz/nvim-dap-go",
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"theHamsta/nvim-dap-virtual-text",

	"groenewege/vim-less",
	"kchmck/vim-coffee-script",

	-- AI Claude
	{
		"greggh/claude-code.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required for git operations
		},
	},
}, {
	ui = {
		border = "rounded",
	},
})
