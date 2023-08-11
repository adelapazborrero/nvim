require("noice").setup({
	lsp = {
		progress = {
			enabled = false,
			format = "lsp_progress",
			format_done = "lsp_progress_done",
			throttle = 1000 / 30, -- frequency to update lsp progress message
			view = "mini",
		},
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},

		message = {
			-- Messages shown by lsp servers
			enabled = false,
			view = "notify",
			opts = {},
		},
	},
	notify = {
		enabled = false,
		view = "notify",
	},
	message = {
		enabled = false,
		view = "notify",
		opts = {},
	},
	popupmenu = {
		enabled = false, -- enables the Noice popupmenu UI
		backend = "nui", -- backend to use to show regular cmdline completions
		kind_icons = {}, -- set to `false` to disable icons
	},
	presets = {
		bottom_search = false, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		-- long_message_to_split = true, -- long messages will be sent to a split
		-- inc_rename = false, -- enables an input dialog for inc-rename.nvim
		-- lsp_doc_border = false, -- add a border to hover docs and signature help
	},
})
