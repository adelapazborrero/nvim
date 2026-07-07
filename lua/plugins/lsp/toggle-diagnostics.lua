return {
	"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
	config = function()
		-- toggle-lsp-diagnostics.nvim toggles every vim.diagnostic.config() key as a
		-- boolean, but newer Neovim added `jump` as a table-only option, which crashes
		-- vim.diagnostic.config() when passed as a boolean. Strip it before it gets there.
		local diagnostic_config = vim.diagnostic.config
		vim.diagnostic.config = function(opts, ...)
			if type(opts) == "table" then
				opts = vim.tbl_extend("force", {}, opts)
				opts.jump = nil
			end
			return diagnostic_config(opts, ...)
		end

		require("toggle_lsp_diagnostics").init({ start_on = true })
	end,
}
