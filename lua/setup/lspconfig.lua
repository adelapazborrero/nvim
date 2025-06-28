local nvim_lsp = require("lspconfig")
local util = require("lspconfig/util")

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = " " },
	{ name = "DiagnosticSignInfo", text = " " },
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

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

nvim_lsp.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.yamlls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.tsserver.setup({ -- Install with npm i -g typescript-language-server
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
})

-- #################################
-- #           LUA SETUP           #
-- #################################
--
-- Install lua_ls https://github.com/LuaLS/lua-language-server/wiki/Getting-Started#command-line
--
nvim_lsp.lua_ls.setup({
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
-- pyright can be installed with `LSPInstallInfo`
--
nvim_lsp.pyright.setup({
	on_attach = on_attach,
	settings = {
		pyright = {
			-- Using Ruff's import organizer
			disableOrganizeImports = true,
		},
		python = {
			analysis = {
				-- Ignore all files for analysis to exclusively use Ruff for linting
				-- ignore = { "*" },
				typeCheckingMode = "strict",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
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

nvim_lsp.ruff.setup({
	capabilities = capabilities,
	init_options = {
		settings = {
			logLevel = "debug",
		},
	},
})

-- #################################
-- #         GOLANG SETUP          #
-- #################################
nvim_lsp.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			analyses = {
				unuseparams = true,
			},
		},
	},
})
