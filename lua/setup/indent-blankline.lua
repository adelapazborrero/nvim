local hooks = require("ibl.hooks")

hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)

require("ibl").setup({
	scope = {
		enabled = true,
		show_start = false,
		include = {
			node_type = {
				["*"] = { "*" },
			},
		},
	},
	indent = {
		char = "▏",
	},
})
