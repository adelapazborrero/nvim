local nvim_treesitter = require("nvim-treesitter.configs")

nvim_treesitter.setup({
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
