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

		-- Replaces karb94/neoscroll.nvim
		local animate = require("mini.animate")
		-- Fixed total duration (distance-independent) so big Ctrl-d/Ctrl-u jumps
		-- don't trail/lag. Scroll and cursor share the same duration so they stay
		-- in sync. Lower the number to make it snappier, raise it for smoother.
		local snappy = animate.gen_timing.linear({ duration = 90, unit = "total" })
		animate.setup({
			scroll = { enable = true, timing = snappy },
			cursor = { enable = true, timing = snappy },
			resize = { enable = false },
			open = { enable = false },
			close = { enable = false },
		})
	end,
}
