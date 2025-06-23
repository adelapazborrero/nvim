local mocha = require("catppuccin.palettes").get_palette("frappe")

require("bufferline").setup({
	options = {
		separator_style = "thin", -- slant, padded_slant, thick, thin
		-- numbers = "ordinal",
		--indicator_icon = '▎',
		buffer_close_icon = "",
		modified_icon = "●",
		-- close_icon = "",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		offsets = { { filetype = "NvimTree", text = "構造", text_align = "center" } },
		color_icons = true, -- whether or not to add the filetype icon highlights
		show_buffer_icons = false, -- disable filetype icons for buffers
		show_buffer_close_icons = false,
		-- show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
		show_close_icon = true,
		show_tab_indicators = true,
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		tab_size = 20,
		highlights = require("catppuccin.groups.integrations.bufferline").get({
			styles = { "italic", "bold" },
			custom = {
				all = {
					fill = { bg = "#000000" },
				},
				mocha = {
					background = { fg = mocha.text },
				},
				latte = {
					background = { fg = "#000000" },
				},
			},
		}),
	},
})
