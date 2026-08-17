-- AI inline completion (ghost text), separate from blink.cmp's identifier menu.
-- Chosen over the official windsurf.nvim client for two reasons: it doesn't
-- flicker, and it has no nvim-cmp coupling -- which matters here since
-- completion/ is on blink.cmp.
--
-- Requires a one-time `:NeoCodeium auth` (free Windsurf/Codeium individual
-- tier); the token is written to ~/.codeium and reused across sessions.
return {
	"monkoose/neocodeium",
	event = "VeryLazy",
	config = function()
		local neocodeium = require("neocodeium")

		neocodeium.setup()

		-- Ghost text and the blink.cmp menu both render at the cursor and
		-- overlap illegibly. Drop the suggestion whenever the menu opens; it
		-- comes back on the next keystroke once the menu closes.
		vim.api.nvim_create_autocmd("User", {
			pattern = "BlinkCmpMenuOpen",
			callback = function()
				neocodeium.clear()
			end,
		})

		-- Insert-mode only, and Alt-prefixed: every C- and Tab binding in this
		-- config's insert mode is already claimed by blink.cmp.
		local opts = { noremap = true, silent = true }

		vim.keymap.set("i", "<C-f>", neocodeium.accept, opts)
		vim.keymap.set("i", "<A-w>", neocodeium.accept_word, opts)
		vim.keymap.set("i", "<A-a>", neocodeium.accept_line, opts)
		vim.keymap.set("i", "<A-e>", function() neocodeium.cycle_or_complete(1) end, opts)
		vim.keymap.set("i", "<A-r>", function() neocodeium.cycle_or_complete(-1) end, opts)
		vim.keymap.set("i", "<A-c>", neocodeium.clear, opts)
	end,
}
