return {
	"catppuccin/nvim",
	priority = 1000,
	lazy = false,
	config = function()
		vim.opt.background = "dark"
		vim.opt.cursorline = true

		require("catppuccin").setup({
			integrations = {
				blink_cmp = true,
			},
		})

		-- Fallback default; overridden by Themery's persisted pick (see
		-- plugins/ui/themery.lua) once you've selected a theme with it.
		vim.cmd("colorscheme catppuccin-frappe")
	end,
}
