return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = {
				{ name = "Catppuccin Latte", colorscheme = "catppuccin-latte" },
				{ name = "Catppuccin Frappe", colorscheme = "catppuccin-frappe" },
				{ name = "Catppuccin Macchiato", colorscheme = "catppuccin-macchiato" },
				{ name = "Catppuccin Mocha", colorscheme = "catppuccin-mocha" },
				{ name = "Tokyonight Storm", colorscheme = "tokyonight-storm" },
				{ name = "Tokyonight Night", colorscheme = "tokyonight-night" },
				{ name = "Tokyonight Moon", colorscheme = "tokyonight-moon" },
				{ name = "Tokyonight Day", colorscheme = "tokyonight-day" },
				{
					name = "Gruvbox Dark",
					colorscheme = "gruvbox",
					before = [[vim.opt.background = "dark"]],
				},
				{
					name = "Gruvbox Light",
					colorscheme = "gruvbox",
					before = [[vim.opt.background = "light"]],
				},
				{ name = "Kanagawa Wave", colorscheme = "kanagawa-wave" },
				{ name = "Kanagawa Dragon", colorscheme = "kanagawa-dragon" },
				{ name = "Kanagawa Lotus", colorscheme = "kanagawa-lotus" },
			},
			livePreview = true,
		})
	end,
}
