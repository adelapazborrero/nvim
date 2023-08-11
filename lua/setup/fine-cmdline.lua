require("fine-cmdline").setup({
	cmdline = {
		enable_keymaps = true,
		smart_history = true,
		prompt = "> ",
	},
	popup = {
		position = "50%",
		relative = "editor",
		zindex = 50,
		border = {
			style = { " ", " ", " ", " ", " ", " ", " ", " " },
			padding = {
				top = 1,
				bottom = 1,
				left = 2,
				right = 2,
			},
			text = {
				top = "Command",
				top_align = "center",
			},
		},
		win_options = {
			-- winblend = 10,
			winhighlight = "Normal:Normal",
		},
	},
})
