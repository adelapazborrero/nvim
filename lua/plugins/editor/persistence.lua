return {
	"folke/persistence.nvim",
	-- Load early so the on-exit autosave autocmd is registered even if you never
	-- press a session key this session.
	event = "BufReadPre",
	config = function()
		require("persistence").setup({
			branch = true, -- separate session per git branch
		})

		-- Match the old behaviour: close nvim-tree before the session is saved so
		-- it doesn't restore into a stale file tree.
		vim.api.nvim_create_autocmd("User", {
			pattern = "PersistenceSavePre",
			callback = function()
				pcall(vim.cmd, "NvimTreeClose")
			end,
		})
	end,
	keys = {
		{ "<leader>qs", function() require("persistence").load() end, desc = "Restore session (cwd)" },
		{ "<leader>qS", function() require("persistence").select() end, desc = "Select a session" },
		{ "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore last session" },
		{ "<leader>qd", function() require("persistence").stop() end, desc = "Stop persistence (won't save)" },
	},
}
