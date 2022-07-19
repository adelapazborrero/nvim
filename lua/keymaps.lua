local opts = { noremap = true, silent = true }

vim.keymap.set("n", "fn", ":noh<CR>", opts)
vim.keymap.set("n", "<C-p>", ":bd<CR>", opts)
