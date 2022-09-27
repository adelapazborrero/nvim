local opts = { noremap = true, silent = true }

-- Navigation
vim.keymap.set("n", "fn", ":noh<CR>", opts)
vim.keymap.set("n", "<C-p>", ":bd<CR>", opts)
vim.keymap.set("n", "<C-p>", ":bd<CR>", opts)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "vs", ":vs<CR> :BufferLineCyclePrev<CR><C-w>w", opts)
vim.keymap.set("n", "wh", "<C-w>h", opts)
vim.keymap.set("n", "wj", "<C-w>j", opts)
vim.keymap.set("n", "wk", "<C-w>k", opts)
vim.keymap.set("n", "wl", "<C-w>l", opts)
vim.keymap.set("n", "wp", "<C-w>q", opts)

-- Dianostics
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Nvim Tree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<C-f>", ":NvimTreeFindFile<CR>", opts)
vim.keymap.set("n", "<leader>n", ":NvimTreeRefresh()<CR>", opts)

-- LSP Saga
vim.keymap.set("n", "K", ":Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "[g", ":Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set("n", "]g", ":Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "<C-k>", ":Lspsaga peek_definition<CR>", opts)

-- GitSigns
vim.keymap.set("n", "gb", ":Gitsigns blame_line<CR>", opts)
vim.keymap.set("n", "gv", ":Gitsigns preview_hunk<CR>", opts)
vim.keymap.set("n", "gr", ":Gitsigns reset_hunk<CR>", opts)

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

-- Hop
vim.api.nvim_set_keymap(
	"",
	"s",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>",
	{}
)
vim.api.nvim_set_keymap(
	"",
	"S",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>",
	{}
)
vim.api.nvim_set_keymap(
	"",
	"t",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>",
	{}
)
vim.api.nvim_set_keymap(
	"",
	"T",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>",
	{}
)

-- Other
vim.keymap.set("n", "fn", ":noh<CR>", opts)
vim.keymap.set("n", "rn", ":%s/\\<<c-r><c-w>\\>//<left>", opts)
