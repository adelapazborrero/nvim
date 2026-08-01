-- Custom highlight overrides that stay legible under any colorscheme.
-- `:colorscheme` wipes custom `nvim_set_hl` groups, so these are re-applied
-- on every ColorScheme event (fired by both `vim.cmd("colorscheme ...")`
-- and Themery's theme picker, see plugins/ui/themery.lua).
--
-- Rather than pulling colors out of one colorscheme's palette (which broke
-- the moment a different theme was picked), everything here links to
-- Diagnostic*/Comment/Special groups, since every maintained colorscheme
-- styles those consistently.
local function apply()
	local hl = vim.api.nvim_set_hl

	-- Floating windows (LSP hover, etc.)
	hl(0, "NormalFloat", { bg = "NONE" })
	hl(0, "FloatBorder", { link = "DiagnosticInfo" })

	-- Telescope
	hl(0, "TelescopeNormal", { bg = "NONE" })
	hl(0, "TelescopePromptNormal", { bg = "NONE" })
	hl(0, "TelescopePromptBorder", { link = "DiagnosticInfo" })
	hl(0, "TelescopeResultsBorder", { link = "DiagnosticInfo" })
	hl(0, "TelescopePreviewBorder", { link = "DiagnosticInfo" })

	-- Debugger signs (used by plugins/debug/dap.lua and the sign_define
	-- calls below)
	hl(0, "DapSignRed", { link = "DiagnosticError" })
	hl(0, "DapSignGreen", { link = "DiagnosticOk" })
	hl(0, "DapSignYellow", { link = "DiagnosticWarn" })
	hl(0, "DapSignOrange", { link = "DiagnosticWarn" })
	hl(0, "DapSignBlue", { link = "DiagnosticInfo" })

	vim.fn.sign_define(
		"DapBreakpointCondition",
		{ text = "•", texthl = "DapSignBlue", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
	)
	vim.fn.sign_define(
		"DapBreakpointRejected",
		{ text = "•", texthl = "DapSignOrange", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
	)
	vim.fn.sign_define(
		"DapLogPoint",
		{ text = "•", texthl = "DapSignYellow", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
	)

	-- Dap UI
	hl(0, "DapUIScope", { link = "DiagnosticWarn" })
	hl(0, "DapUIType", { link = "Special" })
	hl(0, "DapUIValue", { link = "Normal" })
	hl(0, "DapUIModifiedValue", { link = "DiagnosticHint" })
	hl(0, "DapUIDecoration", { link = "DiagnosticHint" })
	hl(0, "DapUIThread", { link = "DiagnosticOk" })
	hl(0, "DapUIStoppedThread", { link = "DiagnosticHint" })
	hl(0, "DapUISource", { link = "Special" })
	hl(0, "DapUILineNumber", { link = "DiagnosticInfo" })
	hl(0, "DapUIFloatBorder", { link = "DiagnosticHint" })
	hl(0, "DapUIWatchesEmpty", { link = "DiagnosticError" })
	hl(0, "DapUIWatchesValue", { link = "DiagnosticOk" })
	hl(0, "DapUIWatchesError", { link = "DiagnosticError" })
	hl(0, "DapUIBreakpointsPath", { link = "DiagnosticHint" })
	hl(0, "DapUIBreakpointsInfo", { link = "DiagnosticOk" })
	hl(0, "DapUIBreakpointsCurrentLine", { link = "DiagnosticOk" })
	hl(0, "DapUIBreakpointsDisabledLine", { link = "Comment" })
	hl(0, "DapUICurrentFrameName", { link = "DiagnosticOk" })
	hl(0, "DapUIStepOver", { link = "DiagnosticHint" })
	hl(0, "DapUIStepInto", { link = "DiagnosticHint" })
	hl(0, "DapUIStepBack", { link = "DiagnosticHint" })
	hl(0, "DapUIStepOut", { link = "DiagnosticHint" })
	hl(0, "DapUIStop", { link = "DiagnosticError" })
	hl(0, "DapUIPlayPause", { link = "DiagnosticOk" })
	hl(0, "DapUIRestart", { link = "DiagnosticOk" })
	hl(0, "DapUIUnavailable", { link = "Comment" })
	hl(0, "DapUIWinSelect", { link = "DiagnosticHint" })
end

apply()

vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("custom-highlight-overrides", { clear = true }),
	callback = apply,
})
