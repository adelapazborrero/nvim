local null_ls = require("null-ls") -- changed from "null-ls" to "none-ls"
local helpers = require("null-ls.helpers")

-- #################################
-- #       SUPPORTED SOURCES       #
-- #################################
local formatting = null_ls.builtins.formatting
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- #################################
-- #         CUSTOM SOURCES        #
-- #################################
local ruff_formatter = {
	method = null_ls.methods.FORMATTING,
	filetypes = { "python" },
	generator = helpers.formatter_factory({
		command = "ruff",
		args = { "--fix", "--stdin-filename", "$FILENAME", "-" },
		to_stdin = true,
	}),
	name = "ruff",
}

local sources = {
	formatting.stylua,
	formatting.gofmt, -- auto installs with golang
	formatting.goimports, -- auto removes unused imports
	formatting.prettierd, -- install with npm install -g @fsouza/prettierd
	ruff_formatter, -- install with curl -LsSf https://astral.sh/ruff/install.sh | sh
}

-- #################################
-- #          LOAD SOURCES         #
-- #################################
null_ls.setup({
	sources = sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr }) -- safer call
				end,
			})
		end
	end,
})
