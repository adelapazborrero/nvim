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

			-- Binaries that aren't LSP servers (null-ls formatters, DAP adapters),
			-- so they don't belong in mason-lspconfig's ensure_installed. Without
			-- these, null-ls silently fails to run its generator and nvim-dap
			-- errors out on launch when the binary is missing.
			local tools = { "goimports", "clang-format", "codelldb" }
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
					"clangd",
					"rust_analyzer",
					"lua_ls",
					"yamlls",
					"jsonls",
					"ts_ls",
					-- Started by hand from plugins/lang/arduino.lua, which has to
					-- bake the sketch's fqbn into the server's argv.
					"arduino_language_server",
				},
				-- lspconfig.lua owns vim.lsp.config()/vim.lsp.enable() for these
				-- servers, so mason only installs binaries here.
				automatic_enable = false,
			})
		end,
	},
}
