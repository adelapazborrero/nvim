return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"gopls",
					"lua_ls",
					"yamlls",
					"jsonls",
					"ts_ls",
				},
				-- lspconfig.lua owns vim.lsp.config()/vim.lsp.enable() for these
				-- servers, so mason only installs binaries here.
				automatic_enable = false,
			})
		end,
	},
}
