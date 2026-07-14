-- nvim-treesitter's `main` branch (as of the 2024 rewrite) is a full,
-- incompatible rewrite of the old `master` branch: `setup({ highlight = ...,
-- indent = ... })` no longer does anything. Parser install is still handled
-- by this plugin, but highlighting/indent/folds are enabled per-filetype via
-- Neovim's own `vim.treesitter.*` API. See :h nvim-treesitter-commands.
local ensure_installed = {
	"go",
	"gomod",
	"gosum",
	"gowork",
	"c",
	"cpp",
	"lua",
	"vim",
	"vimdoc",
	"query",
	"bash",
	"json",
	"yaml",
	"markdown",
	"markdown_inline",
	"javascript",
	"typescript",
	"tsx",
	"python",
}

-- Filetype names Neovim assigns don't always match the parser name above
-- (tsx -> typescriptreact, vimdoc -> help, markdown_inline is injected only).
local filetypes = vim.tbl_map(function(lang)
	if lang == "tsx" then
		return "typescriptreact"
	elseif lang == "vimdoc" then
		return "help"
	end
	return lang
end, vim.tbl_filter(function(lang)
	return lang ~= "markdown_inline"
end, ensure_installed))

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install(ensure_installed)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = filetypes,
			callback = function()
				-- pcall: fires for every ensure_installed filetype even before
				-- :TSUpdate has finished installing its parser
				pcall(vim.treesitter.start)
				vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo[0][0].foldmethod = "expr"
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
