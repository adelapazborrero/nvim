local present, nvim_lsp = pcall(require, "lspconfig")

if not present then
	return
end

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
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

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

nvim_lsp.sumneko_lua.setup({
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

nvim_lsp.volar.setup({
	on_attach = on_attach,
	capabilities = capabilities,

	settings = {
		volar = {
			takeOverMode = {
				enabled = true,
			},
		},
	},
})

nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.intelephense.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.yamlls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

