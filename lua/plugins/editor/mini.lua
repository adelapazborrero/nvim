return {
	"echasnovski/mini.nvim",
	version = "*",
	-- Load before icon consumers (lualine, bufferline, nvim-tree) so the
	-- nvim-web-devicons shim is in place before they require it.
	priority = 1000,
	init = function()
		-- Fallback: make any require("nvim-web-devicons") resolve to mini.icons'
		-- compatibility shim, regardless of load order, now that the real plugin
		-- is removed.
		package.preload["nvim-web-devicons"] = function()
			require("mini.icons").mock_nvim_web_devicons()
			return package.loaded["nvim-web-devicons"]
		end
	end,
	config = function()
		-- Replaces windwp/nvim-autopairs
		require("mini.pairs").setup()

		-- Replaces tpope/vim-commentary  (gc / gcc motions preserved)
		require("mini.comment").setup()

		-- Replaces nvim-web-devicons
		require("mini.icons").setup({
			file = {
				[".gitignore"] = { glyph = "", hl = "MiniIconsRed" },
			},
			extension = {
				vue = { glyph = "", hl = "MiniIconsBlue" },
				log = { glyph = "󰌱", hl = "MiniIconsGreen" },
				zsh = { glyph = "", hl = "MiniIconsGreen" },
			},
		})
		-- Make nvim-web-devicons calls fall through to mini.icons
		MiniIcons.mock_nvim_web_devicons()
	end,
}
