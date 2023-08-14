require("indent_blankline").setup({
	buftype_exclude = { "terminal" },
	char = "▏",
	filetype_exclude = { "help", "NvimTree", "dashboard", "TelescopePrompt", "lsp-installer" },
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = false,
	use_treesitter = true,
})
