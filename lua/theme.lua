vim.cmd("set background=dark")
vim.cmd("set cursorline")

-- COLOR THEMES --
vim.cmd("colorscheme catppuccin-frappe") -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
-- vim.cmd("colorscheme everforest")
-- vim.cmd("colorscheme one")
-- vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme nord")

-- Diagnostics Colors
vim.cmd("highlight DiagnosticError ctermfg=1 guifg=#CF5A68")
vim.cmd("highlight DiagnosticWarn ctermfg=1 guifg=#F1CA81")
vim.cmd("highlight DiagnosticInfo ctermfg=1 guifg=#6AC0FF")
vim.cmd("highlight DiagnosticHint ctermfg=1 guifg=#5581B0")

-- Float colors
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#26283B" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#26283B" })

-- Telescope
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#26283B" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "#26283B" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "#26283B" })

-- LspSaga
vim.api.nvim_set_hl(0, "LspFloatWinBorder", { bg = "#26283B", fg = "#26283B" })
vim.api.nvim_set_hl(0, "LspSagaBorderTitle", { bg = "#26283B" })
vim.api.nvim_set_hl(0, "LspLinesDiagBorder", { bg = "#26283B", fg = "#26283B" })

-- Debugger
vim.api.nvim_set_hl(0, "red", { fg = "#CF5A68" })
vim.api.nvim_set_hl(0, "green", { fg = "#A6DA95" })
vim.api.nvim_set_hl(0, "yellow", { fg = "#e5c890" })
vim.api.nvim_set_hl(0, "orange", { fg = "#ef9f76" })

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "red", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "green", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })

vim.fn.sign_define(
	"DapBreakpointCondition",
	{ text = "•", texthl = "blue", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
	"DapBreakpointRejected",
	{ text = "•", texthl = "orange", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
	"DapLogPoint",
	{ text = "•", texthl = "yellow", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)

-- Dap UI
vim.api.nvim_set_hl(0, "DapUIScope", { fg = "#e5c890" }) -- Cyan
vim.api.nvim_set_hl(0, "DapUIType", { fg = "#eebebe" }) -- Magenta
vim.api.nvim_set_hl(0, "DapUIValue", { fg = "#C6D0F5" }) -- Foreground (text)
vim.api.nvim_set_hl(0, "DapUIModifiedValue", { fg = "#81C8BE" }) -- Cyan (bold)
vim.api.nvim_set_hl(0, "DapUIDecoration", { fg = "#81C8BE" }) -- Cyan
vim.api.nvim_set_hl(0, "DapUIThread", { fg = "#A6D189" }) -- Green
vim.api.nvim_set_hl(0, "DapUIStoppedThread", { fg = "#81C8BE" }) -- Cyan
vim.api.nvim_set_hl(0, "DapUISource", { fg = "#eebebe" }) -- Magenta
vim.api.nvim_set_hl(0, "DapUILineNumber", { fg = "#8caaee" }) -- Cyan
vim.api.nvim_set_hl(0, "DapUIFloatBorder", { fg = "#81C8BE" }) -- Cyan
vim.api.nvim_set_hl(0, "DapUIWatchesEmpty", { fg = "#E78284" }) -- Red
vim.api.nvim_set_hl(0, "DapUIWatchesValue", { fg = "#A6D189" }) -- Green
vim.api.nvim_set_hl(0, "DapUIWatchesError", { fg = "#E78284" }) -- Red
vim.api.nvim_set_hl(0, "DapUIBreakpointsPath", { fg = "#81C8BE" }) -- Cyan
vim.api.nvim_set_hl(0, "DapUIBreakpointsInfo", { fg = "#A6D189" }) -- Green
vim.api.nvim_set_hl(0, "DapUIBreakpointsCurrentLine", { fg = "#A6D189" }) -- Green (bold)
vim.api.nvim_set_hl(0, "DapUIBreakpointsDisabledLine", { fg = "#626880" }) -- Bright black (surface2)
vim.api.nvim_set_hl(0, "DapUICurrentFrameName", { fg = "#A6D189" }) -- Green
vim.api.nvim_set_hl(0, "DapUIStepOver", { fg = "#81C8BE" }) -- Cyan
vim.api.nvim_set_hl(0, "DapUIStepInto", { fg = "#81C8BE" }) -- Cyan
vim.api.nvim_set_hl(0, "DapUIStepBack", { fg = "#81C8BE" }) -- Cyan
vim.api.nvim_set_hl(0, "DapUIStepOut", { fg = "#81C8BE" }) -- Cyan
vim.api.nvim_set_hl(0, "DapUIStop", { fg = "#E78284" }) -- Red
vim.api.nvim_set_hl(0, "DapUIPlayPause", { fg = "#A6D189" }) -- Green
vim.api.nvim_set_hl(0, "DapUIRestart", { fg = "#A6D189" }) -- Green
vim.api.nvim_set_hl(0, "DapUIUnavailable", { fg = "#626880" }) -- Bright black (surface2)
vim.api.nvim_set_hl(0, "DapUIWinSelect", { fg = "#81C8BE" }) -- Cyan (bold)
