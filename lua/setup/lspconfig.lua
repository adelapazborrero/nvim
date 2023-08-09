local present, nvim_lsp = pcall(require, "lspconfig")

if not present then
	return
end

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
		source = "always",
		header = "",
		prefix = "",
	},
})
-- local on_attach = function(client, bufnr)
--   if vim.g.config.use_winbar == true then
--     navic.attach(client, bufnr)
--   end
-- end

local on_attach = function(client, bufnr)
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	local vim_version = vim.version()

	if client.name == "gopls" then
		client.server_capabilities.semanticTokensProvider = {
			full = true,
			legend = {
				tokenTypes = {
					"namespace",
					"type",
					"class",
					"enum",
					"interface",
					"struct",
					"typeParameter",
					"parameter",
					"variable",
					"property",
					"enumMember",
					"event",
					"function",
					"method",
					"macro",
					"keyword",
					"modifier",
					"comment",
					"string",
					"number",
					"regexp",
					"operator",
					"decorator",
				},
				tokenModifiers = {
					"declaration",
					"definition",
					"readonly",
					"static",
					"deprecated",
					"abstract",
					"async",
					"modification",
					"documentation",
					"defaultLibrary",
				},
			},
		}
	end

	if vim_version.minor > 7 then
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	else
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- How to install lua_ls https://github.com/LuaLS/lua-language-server/wiki/Getting-Started#command-line
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

nvim_lsp.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.yamlls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").goimport()
	end,
	group = format_sync_grp,
})

nvim_lsp.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
