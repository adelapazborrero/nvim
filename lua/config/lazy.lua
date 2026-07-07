local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "plugins.lsp" },
	{ import = "plugins.completion" },
	{ import = "plugins.treesitter" },
	{ import = "plugins.debug" },
	{ import = "plugins.git" },
	{ import = "plugins.ui" },
	{ import = "plugins.editor" },
	{ import = "plugins.lang" },
}, {
	ui = {
		border = "rounded",
	},
})

-- WORK AROUND TO OVERRIDE LSPSAGA
vim.diagnostic.config({
	virtual_text = false, -- removes the inline text (squares, error text, etc)
	signs = true, -- keep signs in the sign column (e.g., red ✖)
	underline = true, -- keep or disable underlining
	update_in_insert = false, -- don't update diagnostics while typing
	severity_sort = true, -- sort by severity in float windows etc.
})
