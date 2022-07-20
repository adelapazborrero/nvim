local opts = { noremap = true, silent = true }

-- Navigation
vim.keymap.set("n", "fn", ":noh<CR>", opts)
vim.keymap.set("n", "<C-p>", ":bd<CR>", opts)
vim.keymap.set("n", "<C-p>", ":bd<CR>", opts)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

-- Dianostics
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- LSP Saga
vim.keymap.set("n", "K", ":Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "[g", ":Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set("n", "]g", ":Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "<C-k>", ":Lspsaga preview_definition<CR>", opts)

-- GitSigns
vim.keymap.set("n", "gb", ":Gitsigns blame_line<CR>", opts)

-- Telescope
vim.keymap.set("n", ";f", ":lua require('telescope.builtin').find_files()<CR>", opts)
vim.keymap.set("n", ";r", ":lua require('telescope.builtin').live_grep()<CR>", opts)
vim.keymap.set("n", ";;", ":lua require('telescope.builtin').grep_string()<CR>", opts)
vim.keymap.set("n", "\\\\", ":lua require('telescope.builtin').help_tags()<CR>", opts)

-- Bufferline
vim.keymap.set("n", "<C-h>", ":BufferLineCyclePrev<CR>", opts)
vim.keymap.set("n", "<C-l>", ":BufferLineCycleNext<CR>", opts)
vim.keymap.set("n", "bh", ":BufferLineMovePrev<CR>", opts)
vim.keymap.set("n", "bl", ":BufferLineMoveNext<CR>", opts)

-- Other
vim.keymap.set("n", "fn", ":noh<CR>", opts)
