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
