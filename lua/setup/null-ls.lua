local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

local sources = {
	formatting.prettierd,
	formatting.stylua,
	formatting.phpcsfixer,
}

null_ls.setup({
	sources = sources,
})
