return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-go",
		"nvim-neotest/neotest-python",
		"alfaix/neotest-gtest", -- Google Test adapter for C/C++
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-go"),
				require("neotest-python"),
				require("neotest-gtest"),
			},
		})

		local opts = { noremap = true, silent = true, nowait = true }
		local nt = require("neotest")

		vim.keymap.set("n", "tn", function() nt.run.run() end, opts)
		vim.keymap.set("n", "tf", function() nt.run.run(vim.fn.expand("%")) end, opts)
		vim.keymap.set("n", "ts", function() nt.summary.toggle() end, opts)
		vim.keymap.set("n", "to", function() nt.output_panel.toggle() end, opts)
		vim.keymap.set("n", "tj", function() nt.jump.next({ status = "failed" }) end, opts)
		vim.keymap.set("n", "tk", function() nt.jump.prev({ status = "failed" }) end, opts)
	end,
}
