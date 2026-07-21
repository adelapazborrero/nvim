return {
	{
		"neovim/nvim-lspconfig",
		-- toggle-lsp-diagnostics must configure its defaults before this file's
		-- vim.diagnostic.config() call, or it clobbers virtual_text/signs back to true.
		dependencies = { "Saghen/blink.cmp" },
		config = function()
			local signs = {
				{ name = "DiagnosticSignError", text = "" },
				{ name = "DiagnosticSignWarn", text = "" },
				{ name = "DiagnosticSignHint", text = " " },
				{ name = "DiagnosticSignInfo", text = " " },
			}

			for _, sign in ipairs(signs) do
				vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
			end

			vim.diagnostic.config({
				virtual_text = false,
				signs = {
					active = signs,
				},
				update_in_insert = false,
				underline = true,
				severity_sort = true,
				float = {
					focusable = true,
					style = "",
					border = "rounded",
					-- source = "always",
					source = true,
					header = "",
					prefix = "",
				},
			})

			local on_attach = function(client, bufnr)
				local function buf_set_option(...)
					vim.api.nvim_buf_set_option(bufnr, ...)
				end

				buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

				local vim_version = vim.version()

				if vim_version.minor > 7 then
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				else
					client.resolved_capabilities.document_formatting = false
					client.resolved_capabilities.document_range_formatting = false
				end
			end

			local capabilities = require("blink.cmp").get_lsp_capabilities()

			vim.lsp.config("jsonls", {
				on_attach = on_attach,
				capabilities = capabilities,
			})

			vim.lsp.config("yamlls", {
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					yaml = {
						schemas = {
							kubernetes = "k8s-*.yaml",
							["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
							["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
							["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/**/*.{yml,yaml}",
							["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
							["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
							["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
							["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
						},
					},
				},
			})

			-- #################################
			-- #       TYPESCRIPT SETUP        #
			-- #################################
			--
			-- Install with npm i -g typescript-language-server
			-- :TSInstall typescript javascript tsx
			--
			vim.lsp.config("ts_ls", {
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
			})

			-- #################################
			-- #           LUA SETUP           #
			-- #################################
			--
			-- Installed automatically via mason.nvim (see plugins/lsp/mason.lua)
			--
			vim.lsp.config("lua_ls", {
				on_attach = on_attach,
				capabilities = capabilities,

				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim", "use", "augroup" },
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
							},
							maxPreload = 100000,
							preloadFileSize = 10000,
						},
					},
				},
			})

			-- #################################
			-- #         PYTHON SETUP          #
			-- #################################
			--
			-- ruff setup https://docs.astral.sh/ruff/editors/setup/#neovim
			-- ruff installation curl -LsSf https://astral.sh/ruff/install.sh | sh
			-- pyright can be installed via mason.nvim (:Mason)
			--
			vim.lsp.config("pyright", {
				on_attach = on_attach,
				settings = {
					pyright = {
						-- Using Ruff's import organizer
						disableOrganizeImports = true,
					},
					python = {
						analysis = {
							-- Ignore all files for analysis to exclusively use Ruff for linting
							ignore = { "*" },
							-- typeCheckingMode = "strict",
							-- autoSearchPaths = true,
							-- useLibraryCodeForTypes = true,
						},
					},
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client == nil then
						return
					end
					if client.name == "ruff" then
						-- Disable hover in favor of Pyright
						client.server_capabilities.hoverProvider = false
					end
				end,
				desc = "LSP: Disable hover capability from Ruff",
			})

			vim.lsp.config("ruff", {
				capabilities = capabilities,
				init_options = {
					settings = {
						logLevel = "debug",
					},
				},
			})

			-- #################################
			-- #           C/C++ SETUP         #
			-- #################################
			--
			-- Installed automatically via mason.nvim (see plugins/lsp/mason.lua).
			-- clangd works fallback-flags out of the box for single files; drop a
			-- compile_commands.json (e.g. via `bear -- make` or CMake's
			-- CMAKE_EXPORT_COMPILE_COMMANDS=ON) at the project root for accurate
			-- per-file flags on real projects.
			--
			vim.lsp.config("clangd", {
				on_attach = on_attach,
				capabilities = capabilities,
				cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu" },
			})

			-- #################################
			-- #         GOLANG SETUP          #
			-- #################################
			--
			-- nvim-lspconfig's built-in gopls root_dir detection (go.work/go.mod/.git,
			-- with GOMODCACHE/GOROOT awareness) supersedes the old util.root_pattern
			-- override, so it's intentionally not repeated here.
			--
			vim.lsp.config("gopls", {
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					gopls = {
						completeUnimported = true,
						analyses = {
							unuseparams = true,
						},
					},
				},
			})

			-- #################################
			-- #         R2D2 (bol IaC)        #
			-- #################################
			--
			-- Custom language server for R2D2 spec files, built from
			-- ~/Projects/SecOps/r2d2-lsp (`make install`). Attaches only to R2D2
			-- specs (r2d2-*.yml/.yaml or anything under infra/r2d2/), so it runs
			-- alongside yamlls without touching other YAML.
			--
			local function is_r2d2_file(name)
				return name:match("r2d2%-[^/]*%.ya?ml$") ~= nil or name:match("/infra/r2d2/") ~= nil
			end

			vim.lsp.config("r2d2", {
				cmd = { vim.fn.expand("~/go/bin/r2d2-lsp"), "--schema-version", "latest" },
				filetypes = { "yaml" },
				root_dir = function(bufnr, on_dir)
					local name = vim.api.nvim_buf_get_name(bufnr)
					if is_r2d2_file(name) then
						on_dir(vim.fs.dirname(name))
					end
				end,
				on_attach = on_attach,
				capabilities = capabilities,
			})

			vim.lsp.enable({ "jsonls", "yamlls", "ts_ls", "lua_ls", "pyright", "ruff", "gopls", "clangd", "r2d2" })
		end,
	},
	{
		"folke/lsp-colors.nvim",
		config = function()
			require("lsp-colors").setup({
				Error = "#CD5A68",
				Warning = "#F1CA81",
				Information = "#5581B1",
				Hint = "#FFFBEE",
			})
		end,
	},
}
