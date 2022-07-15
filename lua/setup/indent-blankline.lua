local present, indentline = pcall(require, "indent_blankline")

if not present then
	return
end

indentline.setup({
	buftype_exclude = { "terminal" },
	char = "▏",
	filetype_exclude = { "help", "NvimTree", "dashboard", "packer", "TelescopePrompt", "lsp-installer" },
	show_current_context = false,
	show_current_context_start = false,
	space_char_blankline = " ",
	use_treesitter = false,
})
