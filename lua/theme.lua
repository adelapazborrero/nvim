vim.cmd("set background=dark")
vim.cmd("set cursorline")

-- COLOR THEMES --
vim.cmd("colorscheme catppuccin-frappe") -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
-- vim.cmd("colorscheme hackthebox")
-- vim.cmd("colorscheme alabaster")
-- vim.cmd("colorscheme lackluster-hack")
-- vim.cmd("colorscheme darcula-solid")
-- vim.cmd("colorscheme hardhacker")
-- vim.cmd("colorscheme everforest")
-- vim.cmd("colorscheme one")
-- vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme nord")
-- vim.cmd("colorscheme cobalt2")

-- Diagnostics Colors
-- vim.cmd("highlight DiagnosticError ctermfg=1 guifg=#CF5A68")
-- vim.cmd("highlight DiagnosticWarn ctermfg=1 guifg=#F1CA81")
-- vim.cmd("highlight DiagnosticInfo ctermfg=1 guifg=#6AC0FF")
-- vim.cmd("highlight DiagnosticHint ctermfg=1 guifg=#5581B0")

-- Float colors
-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#26283B" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#26283B" })

-- Telescope
-- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#26283B" })
-- vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "#26283B" })

-- vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "#292c3c" })
-- vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "#292c3c", fg = "#8caaee" })
-- vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "#292c3c" })
-- vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { bg = "#292c3c", fg = "#8caaee" })

-- vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "#26283B" })
-- vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "#26283B", fg = "#8caaee" })
-- vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = "#26283B" })
-- vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = "#26283B" })


-- LspSaga
-- Border = {
-- 	{ "╭", "FloatBorder" },
-- 	{ "─", "FloatBorder" },
-- 	{ "╮", "FloatBorder" },
-- 	{ "│", "FloatBorder" },
-- 	{ "╯", "FloatBorder" },
-- 	{ "─", "FloatBorder" },
-- 	{ "╰", "FloatBorder" },
-- 	{ "│", "FloatBorder" },
-- }

-- vim.api.nvim_command(
-- 	"autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({border="
-- 		.. vim.inspect(Border)
-- 		.. ", focusable=false})"
-- )
-- vim.api.nvim_set_hl(0, "LspSagaBorderTitle", { bg = "#26283B" })
-- vim.api.nvim_set_hl(0, "LspSagaNormalTitle", { bg = "#26283B" })
-- vim.api.nvim_set_hl(0, "LspLinesDiagBorder", { bg = "#26283B", fg = "#8caaee" })
-- vim.api.nvim_set_hl(0, "LspLinesDiagNormal", { bg = "#26283B", fg = "#26283B" })
-- vim.api.nvim_set_hl(0, "LspFloatWinBorder", { bg = "#26283B", fg = "#8caaee" })
-- vim.api.nvim_set_hl(0, "LspFloatWinNormal", { bg = "#26283B", fg = "#26283B" })
-- vim.api.nvim_set_hl(0, "SagaBorder", { bg = "#26283B" })
-- vim.api.nvim_set_hl(0, "SagaNormal", { bg = "#26283B" })
-- vim.api.nvim_set_hl(0, "HoverBorder", { bg = "#26283B", fg = "#8caaee" })
-- vim.api.nvim_set_hl(0, "HoverNormal", { bg = "#26283B" })
-- vim.api.nvim_set_hl(0, "DiagnosticNormal", { bg = "#26283B", fg = "#26283B" })
-- vim.api.nvim_set_hl(0, "DiagnosticBorder", { bg = "#26283B", fg = "#8caaee" })
-- vim.api.nvim_set_hl(0, "ActionFix", { bg = "#26283B", fg = "#26283B" })
-- vim.api.nvim_set_hl(0, "ActionPreviewNormal", { bg = "#26283B", fg = "#26283B" })
-- vim.api.nvim_set_hl(0, "ActionPreviewBorder", { bg = "#26283B", fg = "#8caaee" })
-- vim.api.nvim_set_hl(0, "ActionPreviewTitle", { bg = "#26283B", fg = "#26283B" })
-- vim.api.nvim_set_hl(0, "SagaDetail", { bg = "#26283B", fg = "#26283B" })

-- Debugger
-- vim.api.nvim_set_hl(0, "red", { fg = "#CF5A68" })
-- vim.api.nvim_set_hl(0, "green", { fg = "#A6DA95" })
-- vim.api.nvim_set_hl(0, "yellow", { fg = "#e5c890" })
-- vim.api.nvim_set_hl(0, "orange", { fg = "#ef9f76" })

-- vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "red", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })
-- vim.fn.sign_define("DapStopped", { text = "", texthl = "green", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })

-- vim.fn.sign_define(
-- 	"DapBreakpointCondition",
-- 	{ text = "•", texthl = "blue", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
-- )
-- vim.fn.sign_define(
-- 	"DapBreakpointRejected",
-- 	{ text = "•", texthl = "orange", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
-- )
-- vim.fn.sign_define(
-- 	"DapLogPoint",
-- 	{ text = "•", texthl = "yellow", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
-- )

-- Dap UI
-- vim.api.nvim_set_hl(0, "DapUIScope", { fg = "#e5c890" })
-- vim.api.nvim_set_hl(0, "DapUIType", { fg = "#eebebe" })
-- vim.api.nvim_set_hl(0, "DapUIValue", { fg = "#C6D0F5" })
-- vim.api.nvim_set_hl(0, "DapUIModifiedValue", { fg = "#81C8BE" })
-- vim.api.nvim_set_hl(0, "DapUIDecoration", { fg = "#81C8BE" })
-- vim.api.nvim_set_hl(0, "DapUIThread", { fg = "#A6D189" })
-- vim.api.nvim_set_hl(0, "DapUIStoppedThread", { fg = "#81C8BE" })
-- vim.api.nvim_set_hl(0, "DapUISource", { fg = "#eebebe" })
-- vim.api.nvim_set_hl(0, "DapUILineNumber", { fg = "#8caaee" })
-- vim.api.nvim_set_hl(0, "DapUIFloatBorder", { fg = "#81C8BE" })
-- vim.api.nvim_set_hl(0, "DapUIWatchesEmpty", { fg = "#E78284" })
-- vim.api.nvim_set_hl(0, "DapUIWatchesValue", { fg = "#A6D189" })
-- vim.api.nvim_set_hl(0, "DapUIWatchesError", { fg = "#E78284" })
-- vim.api.nvim_set_hl(0, "DapUIBreakpointsPath", { fg = "#81C8BE" })
-- vim.api.nvim_set_hl(0, "DapUIBreakpointsInfo", { fg = "#A6D189" })
-- vim.api.nvim_set_hl(0, "DapUIBreakpointsCurrentLine", { fg = "#A6D189" })
-- vim.api.nvim_set_hl(0, "DapUIBreakpointsDisabledLine", { fg = "#626880" })
-- vim.api.nvim_set_hl(0, "DapUICurrentFrameName", { fg = "#A6D189" })
-- vim.api.nvim_set_hl(0, "DapUIStepOver", { fg = "#81C8BE" })
-- vim.api.nvim_set_hl(0, "DapUIStepInto", { fg = "#81C8BE" })
-- vim.api.nvim_set_hl(0, "DapUIStepBack", { fg = "#81C8BE" })
-- vim.api.nvim_set_hl(0, "DapUIStepOut", { fg = "#81C8BE" })
-- vim.api.nvim_set_hl(0, "DapUIStop", { fg = "#E78284" })
-- vim.api.nvim_set_hl(0, "DapUIPlayPause", { fg = "#A6D189" })
-- vim.api.nvim_set_hl(0, "DapUIRestart", { fg = "#A6D189" })
-- vim.api.nvim_set_hl(0, "DapUIUnavailable", { fg = "#626880" })
-- vim.api.nvim_set_hl(0, "DapUIWinSelect", { fg = "#81C8BE" })

-- Notify
-- vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = "#E78284" })
-- vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = "#E5C890" })
-- vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = "#8CAAEE" })
-- vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = "#B5BFE2" })
-- vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { fg = "#F4B8E4" })
-- vim.api.nvim_set_hl(0, "NotifyERRORIcon", { fg = "#E78284" })
-- vim.api.nvim_set_hl(0, "NotifyWARNIcon", { fg = "#E5C890" })
-- vim.api.nvim_set_hl(0, "NotifyINFOIcon", { fg = "#8CAAEE" })
-- vim.api.nvim_set_hl(0, "NotifyDEBUGIcon", { fg = "#B5BFE2" })
-- vim.api.nvim_set_hl(0, "NotifyTRACEIcon", { fg = "#F4B8E4" })
-- vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = "#E78284" })
-- vim.api.nvim_set_hl(0, "NotifyWARNTitle", { fg = "#E5C890" })
-- vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = "#8CAAEE" })
-- vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { fg = "#B5BFE2" })
-- vim.api.nvim_set_hl(0, "NotifyTRACETitle", { fg = "#F4B8E4" })
