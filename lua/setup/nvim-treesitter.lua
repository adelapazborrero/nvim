require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
		custom_captures = {
			["attr.value"] = "TSKeyword",
		},
	},
	indent = {
		enable = true,
	},
})
