vim.cmd("set background=dark")
vim.cmd("set cursorline")

-- COLOR THEMES --
vim.cmd("colorscheme catppuccin-frappe") -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

local cp = require("catppuccin.palettes").get_palette("frappe")

-- LspSaga
vim.api.nvim_set_hl(0, "HoverBorder", { bg = cp.base, fg = cp.blue })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = cp.base })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = cp.base, fg = cp.blue })

-- Telescope
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = cp.blue, bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = cp.blue, bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = cp.blue, bg = "none" })

-- Debugger
vim.api.nvim_set_hl(0, "red", { fg = cp.red })
vim.api.nvim_set_hl(0, "green", { fg = cp.green })
vim.api.nvim_set_hl(0, "yellow", { fg = cp.yellow })
vim.api.nvim_set_hl(0, "orange", { fg = cp.peach })

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
vim.api.nvim_set_hl(0, "DapUIScope", { fg = cp.yellow })
vim.api.nvim_set_hl(0, "DapUIType", { fg = cp.pink })
vim.api.nvim_set_hl(0, "DapUIValue", { fg = cp.text })
vim.api.nvim_set_hl(0, "DapUIModifiedValue", { fg = cp.teal })
vim.api.nvim_set_hl(0, "DapUIDecoration", { fg = cp.teal })
vim.api.nvim_set_hl(0, "DapUIThread", { fg = cp.green })
vim.api.nvim_set_hl(0, "DapUIStoppedThread", { fg = cp.teal })
vim.api.nvim_set_hl(0, "DapUISource", { fg = cp.pink })
vim.api.nvim_set_hl(0, "DapUILineNumber", { fg = cp.blue })
vim.api.nvim_set_hl(0, "DapUIFloatBorder", { fg = cp.teal })
vim.api.nvim_set_hl(0, "DapUIWatchesEmpty", { fg = cp.red })
vim.api.nvim_set_hl(0, "DapUIWatchesValue", { fg = cp.green })
vim.api.nvim_set_hl(0, "DapUIWatchesError", { fg = cp.red })
vim.api.nvim_set_hl(0, "DapUIBreakpointsPath", { fg = cp.teal })
vim.api.nvim_set_hl(0, "DapUIBreakpointsInfo", { fg = cp.green })
vim.api.nvim_set_hl(0, "DapUIBreakpointsCurrentLine", { fg = cp.green })
vim.api.nvim_set_hl(0, "DapUIBreakpointsDisabledLine", { fg = cp.overlay0 })
vim.api.nvim_set_hl(0, "DapUICurrentFrameName", { fg = cp.green })
vim.api.nvim_set_hl(0, "DapUIStepOver", { fg = cp.teal })
vim.api.nvim_set_hl(0, "DapUIStepInto", { fg = cp.teal })
vim.api.nvim_set_hl(0, "DapUIStepBack", { fg = cp.teal })
vim.api.nvim_set_hl(0, "DapUIStepOut", { fg = cp.teal })
vim.api.nvim_set_hl(0, "DapUIStop", { fg = cp.red })
vim.api.nvim_set_hl(0, "DapUIPlayPause", { fg = cp.green })
vim.api.nvim_set_hl(0, "DapUIRestart", { fg = cp.green })
vim.api.nvim_set_hl(0, "DapUIUnavailable", { fg = cp.overlay0 })
vim.api.nvim_set_hl(0, "DapUIWinSelect", { fg = cp.teal })

-- Notify
vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = cp.red })
vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = cp.yellow })
vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = cp.blue })
vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = cp.sky })
vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { fg = cp.mauve })

vim.api.nvim_set_hl(0, "NotifyERRORIcon", { fg = cp.red })
vim.api.nvim_set_hl(0, "NotifyWARNIcon", { fg = cp.yellow })
vim.api.nvim_set_hl(0, "NotifyINFOIcon", { fg = cp.blue })
vim.api.nvim_set_hl(0, "NotifyDEBUGIcon", { fg = cp.sky })
vim.api.nvim_set_hl(0, "NotifyTRACEIcon", { fg = cp.mauve })

vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = cp.red })
vim.api.nvim_set_hl(0, "NotifyWARNTitle", { fg = cp.yellow })
vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = cp.blue })
vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { fg = cp.sky })
vim.api.nvim_set_hl(0, "NotifyTRACETitle", { fg = cp.mauve })
