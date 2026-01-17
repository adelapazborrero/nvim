-- Custom retro amber theme for lualine
local retro_amber_lualine = {
	normal = {
		a = { fg = "#0f0a00", bg = "#ffb000", gui = "bold" },
		b = { fg = "#ffb000", bg = "#2a1f00" },
		c = { fg = "#996600", bg = "#1a1200" },
	},
	insert = {
		a = { fg = "#0f0a00", bg = "#ffc333", gui = "bold" },
		b = { fg = "#ffc333", bg = "#2a1f00" },
		c = { fg = "#996600", bg = "#1a1200" },
	},
	visual = {
		a = { fg = "#0f0a00", bg = "#e69500", gui = "bold" },
		b = { fg = "#e69500", bg = "#2a1f00" },
		c = { fg = "#996600", bg = "#1a1200" },
	},
	replace = {
		a = { fg = "#0f0a00", bg = "#ff6600", gui = "bold" },
		b = { fg = "#ff6600", bg = "#2a1f00" },
		c = { fg = "#996600", bg = "#1a1200" },
	},
	command = {
		a = { fg = "#0f0a00", bg = "#ffd966", gui = "bold" },
		b = { fg = "#ffd966", bg = "#2a1f00" },
		c = { fg = "#996600", bg = "#1a1200" },
	},
	inactive = {
		a = { fg = "#664400", bg = "#1a1200" },
		b = { fg = "#664400", bg = "#1a1200" },
		c = { fg = "#664400", bg = "#0f0a00" },
	},
}

-- Determine which theme to use
local lualine_theme = "auto"
local ok, _ = pcall(require, "colors.retro_amber")
if ok and vim.g.colors_name == "retro_amber" then
	lualine_theme = retro_amber_lualine
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = lualine_theme,
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = false,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
