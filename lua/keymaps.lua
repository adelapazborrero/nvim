local keymap = vim.keymap
local opts = { noremap = true, silent = true, nowait = true }

-- Debugging
function OpenUI()
	local widgets = require("dap.ui.widgets")
	local sidebar = widgets.sidebar(widgets.scope)
	sidebar.open()
end

-- GoDbgConfig
function StartDebugger()
	vim.api.nvim_echo({ { "  Starting debugger \n", "Normal" } }, true, {})
	vim.cmd(":lua require('dap').continue()")
end

function StopDebugger()
	vim.cmd(":lua require('dap').terminate()")
	vim.cmd(":lua require('dapui').close()")
end

-- https://tamerlan.dev/a-guide-to-debugging-applications-in-neovim/
keymap.set("n", "bs", ":lua StartDebugger()<CR>", opts)
keymap.set("n", "bb", ":lua require('dap').toggle_breakpoint()<CR>", opts)
keymap.set("n", "bp", ":lua require('dap').continue()<CR>", opts)
keymap.set("n", "bu", ":lua require('dap').step_over()<CR>", opts)
keymap.set("n", "bi", ":lua require('dap').step_into()<CR>", opts)
keymap.set("n", "bo", ":lua require('dap').step_out()<CR>", opts)
keymap.set("n", "bc", ":lua StopDebugger()<CR>", opts)
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

-- Nvim Tree
keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
keymap.set("n", "<C-f>", ":NvimTreeFindFile<CR>", opts)
keymap.set("n", "<leader>n", ":NvimTreeRefresh()<CR>", opts)

-- LSP Saga
keymap.set("n", "K", ":Lspsaga hover_doc<CR>", opts)
keymap.set("n", "[g", ":Lspsaga diagnostic_jump_prev<CR>", opts)
keymap.set("n", "]g", ":Lspsaga diagnostic_jump_next<CR>", opts)
keymap.set("n", "<C-k>", ":Lspsaga peek_definition<CR>", opts)
keymap.set("n", "fo", ":Lspsaga finder tyd+ref+imp+def<CR>", opts)

-- GitSigns
keymap.set("n", "gb", ":Gitsigns blame_line<CR>", opts)
keymap.set("n", "gv", ":Gitsigns preview_hunk<CR>", opts)
keymap.set("n", "gr", ":Gitsigns reset_hunk<CR>", opts)

-- Telescope
keymap.set("n", ";f", ":lua require('telescope.builtin').find_files()<CR>", opts)
keymap.set("n", ";r", ":lua require('telescope.builtin').live_grep()<CR>", opts)
keymap.set("n", ";;", ":lua require('telescope.builtin').grep_string()<CR>", opts)
keymap.set("n", "\\\\", ":lua require('telescope.builtin').help_tags()<CR>", opts)
-- keymap.set("n", "fr", ":lua require('telescope.builtin').lsp_references()<CR>", opts)
-- keymap.set("n", "fi", ":lua require('telescope.builtin').lsp_implementations()<CR>", opts)
keymap.set("n", "fd", ":lua require('telescope.builtin').lsp_definitions()<CR>", opts)

-- Bufferline
keymap.set("n", "<C-h>", ":BufferLineCyclePrev<CR>", opts)
keymap.set("n", "<C-l>", ":BufferLineCycleNext<CR>", opts)
keymap.set("n", "bh", ":BufferLineMovePrev<CR>", opts)
keymap.set("n", "bl", ":BufferLineMoveNext<CR>", opts)

-- Flash
keymap.set("n", "s", function()
	require("flash").jump({ search = { mode = "plain", force = true } })
end, opts)
keymap.set("x", "s", function()
	require("flash").jump({ search = { mode = "plain", force = true } })
end, opts)
keymap.set("o", "s", function()
	require("flash").jump({ search = { mode = "plain", force = true } })
end, opts)

keymap.set("n", "S", ":lua require('flash').treesitter()<CR>", opts)
keymap.set("x", "S", ":lua require('flash').treesitter()<CR>", opts)
keymap.set("o", "s", ":lua require('flash').treesitter()<CR>", opts)

-- Ufo
vim.keymap.set("n", "zR", ":lua require('ufo').openAllFolds()<CR>", opts)
vim.keymap.set("n", "zM", ":lua require('ufo').closeAllFolds()<CR>", opts)
vim.keymap.set("n", "zo", ":lua require('ufo').openFoldsExceptKinds()<CR>", opts)
vim.keymap.set("n", "zm", ":lua require('ufo').closeFoldsWith()<CR>", opts)

-- Other
keymap.set("n", "fn", ":noh<CR>", opts)
vim.keymap.set("n", "rn", ":IncRename ")
