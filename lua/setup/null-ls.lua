local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

local sources = {
	formatting.prettierd, -- mainly ts, js, yml files
	formatting.stylua,    -- mainly for lua files
	formatting.phpcsfixer,-- mainly for php files
	formatting.gofmt,     -- mainly for go files
}

null_ls.setup({
	sources = sources,
})
