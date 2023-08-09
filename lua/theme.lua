vim.cmd("set background=dark")
vim.cmd('set guifont="Hack Nerd Font"')
vim.cmd("set cursorline")

vim.cmd("hi! CocErrorSign guifg=#cc6666")
vim.cmd("hi! CocInfoSign guibg=#268BD2")
vim.cmd("hi! CocWarningSign guifg=#D33682")

-- COLOR THEMES --
vim.cmd("colorscheme catppuccin-frappe") -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
-- vim.cmd("colorscheme everforest")
-- vim.cmd("colorscheme one")
-- vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme nord")

vim.cmd("set cursorline")

-- Diagnostics Colors
vim.cmd("highlight DiagnosticError ctermfg=1 guifg=#CF5A68")
vim.cmd("highlight DiagnosticWarn ctermfg=1 guifg=#F1CA81")
vim.cmd("highlight DiagnosticInfo ctermfg=1 guifg=##6AC0FF")
vim.cmd("highlight DiagnosticHint ctermfg=1 guifg=#5581B0")

vim.cmd("highlight FloatBorder ctermfg=1 guifg=#6ac0ff")
vim.cmd("highlight LspSagaHoverBorder guifg='#6ac0ff'")
