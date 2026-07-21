return {
	"Saghen/blink.cmp",
	version = "*",
	opts = {
		keymap = {
			preset = "none",
			["<C-Space>"] = { "show", "fallback" },
			["<C-e>"] = { "cancel", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<C-k>"] = { "scroll_documentation_up", "fallback" },
			["<C-j>"] = { "scroll_documentation_down", "fallback" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		cmdline = {
			sources = { "cmdline" },
		},
		completion = {
			menu = {
				border = "single",
				min_width = 40,
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
				window = {
					border = "double",
				},
			},
		},
	},
}
