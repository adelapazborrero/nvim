vim.cmd("set background=dark")
vim.cmd('set guifont="Hack Nerd Font"')
vim.cmd("set cursorline")

vim.cmd("hi! CocErrorSign guifg=#cc6666")
vim.cmd("hi! CocInfoSign guibg=#268BD2")
vim.cmd("hi! CocWarningSign guifg=#D33682")

-- Transparent background
-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
-- vim.cmd("hi LineNr guibg=#2c3b41 ctermbg=NONE")
-- vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
-- vim.cmd("hi CursorLineNr cterm=NONE guifg=NONE guibg=#2c3b41")
-- vim.cmd("hi CursorLine cterm=NONE guifg=NONE guibg=#2c3b41")
-- vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")

-- COLOR THEMES --
vim.cmd("colorscheme one")
-- vim.cmd("colorscheme base16-default-dark")
-- vim.cmd("colorscheme OceanicNext")
-- vim.cmd("colorscheme nordfox")
-- vim.cmd("colorscheme NeoSolarized")
-- vim.cmd("colorscheme hybrid_material")
-- vim.cmd("colorscheme material")
-- vim.cmd("colorscheme iceberg")
-- vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme nord")

vim.cmd("set cursorline")
vim.cmd("highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40")
vim.cmd("highlight LineNr cterm=NONE ctermfg=236 guifg=#4C566A guibg=#3B4252")

-- Diagnostics Colors
vim.cmd("highlight DiagnosticError ctermfg=1 guifg=#CF5A68")
vim.cmd("highlight DiagnosticWarn ctermfg=1 guifg=#F1CA81")
vim.cmd("highlight DiagnosticInfo ctermfg=1 guifg=##6AC0FF")
vim.cmd("highlight DiagnosticHint ctermfg=1 guifg=#5581B0")

vim.cmd("highlight FloatBorder ctermfg=1 guifg=#6ac0ff")
vim.cmd("highlight LspSagaHoverBorder guifg='#6ac0ff'")

-- Diagnostic underlines
-- vim.cmd("highlight DiagnosticUnderlineError ctermfg=1 guifg=#CF5A68")
-- vim.cmd("highlight DiagnosticUnderlineWarn ctermfg=1 guifg=#F1CA81")
-- vim.cmd("highlight DiagnosticUnderlineInfo ctermfg=1 guifg=#FFFEFA")
-- vim.cmd("highlight DiagnosticUnderlineHint ctermfg=1 guifg=#5581B0")

-- NEOSOLARIZED --
-- vim.cmd("autocmd vimenter * ++nested colorscheme solarized8")
-- vim.cmd("autocmd vimenter * ++nested highlight LineNr cterm=NONE guifg=#50727C guibg=#043542")
-- vim.cmd("autocmd vimenter * ++nested highlight CursorLineNr cterm=NONE guifg=NONE guibg=#043542")
-- vim.cmd("autocmd vimenter * ++nested highlight NvimTreeFolderIcon guifg=#238BD2")

-- vim.cmd("autocmd vimenter * ++nested hi! CocErrorSign guifg=#cb4b16")
-- vim.cmd("autocmd vimenter * ++nested hi! CocInfoSign guibg=#268BD2")
-- vim.cmd("autocmd vimenter * ++nested hi! CocWarningSign guifg=#D33682")

-- vim.cmd("let g:solarized_termtrans = 1")
-- vim.cmd("let g:solarized_extra_hi_groups = 1")
