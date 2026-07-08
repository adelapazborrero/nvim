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

			-- null-ls formatters that aren't LSP servers, so they don't belong in
			-- mason-lspconfig's ensure_installed. Without these, null-ls silently
			-- fails to run its generator when the binary is missing.
			local tools = { "goimports" }
			local registry = require("mason-registry")
			registry.refresh(function()
				for _, name in ipairs(tools) do
					local pkg = registry.get_package(name)
					if not pkg:is_installed() then
						pkg:install()
					end
				end
			end)
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
