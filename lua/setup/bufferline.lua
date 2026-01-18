require("bufferline").setup({
	options = {
		separator_style = "thin", -- slant, padded_slant, thick, thin
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		offsets = {
			{
				filetype = "NvimTree",
				text = "構造",
				text_align = "center",
			},
		},
		color_icons = true,
		show_buffer_icons = false,
		show_buffer_close_icons = false,
		show_close_icon = true,
		show_tab_indicators = true,
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		tab_size = 20,
	},
})
