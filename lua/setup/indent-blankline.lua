require("indent_blankline").setup({
	buftype_exclude = { "terminal" },
	char = "▏",
	filetype_exclude = { "help", "NvimTree", "dashboard", "TelescopePrompt", "lsp-installer" },
	show_current_context = false,
	show_current_context_start = false,
	space_char_blankline = " ",
	use_treesitter = false,
})
