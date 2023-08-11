local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Debugging
function OpenUI()
	local widgets = require("dap.ui.widgets")
	local sidebar = widgets.sidebar(widgets.scope)
	sidebar.open()
end

-- GoDbgConfig

-- keymap.set("n", "bb", ":lua require('dap').toggle_breakpoint()<CR>", opts)
keymap.set("n", "bb", ":GoBreakToggle<CR>", opts)
-- keymap.set("n", "bs", ":lua require('dap').continue()<CR>", opts) -- lightweight implementation
keymap.set("n", "bs", ":GoDebug<CR>", opts) --heavy implementation
keymap.set("n", "bp", ":DapContinue<CR>", opts) --heavy implementation
keymap.set("n", "bu", ":lua require('dap').step_over()<CR>", opts)
keymap.set("n", "bi", ":lua require('dap').step_into()<CR>", opts)
keymap.set("n", "bo", ":lua require('dap').step_out()<CR>", opts)
keymap.set("n", "bc", ":lua require('dap').terminate()<CR>", opts)
keymap.set("n", "bv", ":lua require('dapui').toggle()<CR>", opts)

keymap.set("n", "bt", ":lua require('dap-go').debug_test()<CR>", opts)

-- Navigation
keymap.set("n", "fn", ":noh<CR>", opts)
keymap.set("n", "<C-p>", ":bd<CR>", opts)
keymap.set("n", "<C-p>", ":bd<CR>", opts)
keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
keymap.set("n", "gd", vim.lsp.buf.definition, opts)
keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
keymap.set("n", "vs", ":vs<CR> :BufferLineCyclePrev<CR><C-w>w", opts)
keymap.set("n", "wh", "<C-w>h", opts)
keymap.set("n", "wj", "<C-w>j", opts)
keymap.set("n", "wk", "<C-w>k", opts)
keymap.set("n", "wl", "<C-w>l", opts)
keymap.set("n", "wp", "<C-w>q", opts)

-- Dianostics
keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Nvim Tree
keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
keymap.set("n", "<C-f>", ":NvimTreeFindFile<CR>", opts)
keymap.set("n", "<leader>n", ":NvimTreeRefresh()<CR>", opts)

-- LSP Saga
keymap.set("n", "K", ":Lspsaga hover_doc<CR>", opts)
keymap.set("n", "[g", ":Lspsaga diagnostic_jump_prev<CR>", opts)
keymap.set("n", "]g", ":Lspsaga diagnostic_jump_next<CR>", opts)
keymap.set("n", "<C-k>", ":Lspsaga peek_definition<CR>", opts)
keymap.set("n", "fo", ":Lspsaga finder def+ref<CR>", opts)
keymap.set("n", "rn", ":Lspsaga rename<CR>")

-- GitSigns
keymap.set("n", "gb", ":Gitsigns blame_line<CR>", opts)
keymap.set("n", "gv", ":Gitsigns preview_hunk<CR>", opts)
keymap.set("n", "gr", ":Gitsigns reset_hunk<CR>", opts)

-- Telescope
keymap.set("n", ";f", ":lua require('telescope.builtin').find_files()<CR>", opts)
keymap.set("n", ";r", ":lua require('telescope.builtin').live_grep()<CR>", opts)
keymap.set("n", ";;", ":lua require('telescope.builtin').grep_string()<CR>", opts)
keymap.set("n", "\\\\", ":lua require('telescope.builtin').help_tags()<CR>", opts)
keymap.set("n", "fr", ":lua require('telescope.builtin').lsp_references()<CR>", opts)
keymap.set("n", "fi", ":lua require('telescope.builtin').lsp_implementations()<CR>", opts)
keymap.set("n", "fd", ":lua require('telescope.builtin').lsp_definitions()<CR>", opts)

-- Bufferline
keymap.set("n", "<C-h>", ":BufferLineCyclePrev<CR>", opts)
keymap.set("n", "<C-l>", ":BufferLineCycleNext<CR>", opts)
keymap.set("n", "bh", ":BufferLineMovePrev<CR>", opts)
keymap.set("n", "bl", ":BufferLineMoveNext<CR>", opts)

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

--Trouble
keymap.set("n", ",,", ":TroubleToggle<CR>", opts)

-- Other
keymap.set("n", "fn", ":noh<CR>", opts)
