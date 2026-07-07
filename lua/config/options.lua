vim.opt.encoding = "utf-8"
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.backup = false
vim.opt.hlsearch = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.scrolloff = 10
vim.opt.expandtab = true
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.swapfile = false

vim.opt.mouse = "a"
vim.cmd("set t_Co=256")

vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append("**")
vim.opt.wildignore:append("*/node_modules/*")
vim.opt.formatoptions:append("r")
vim.opt.guicursor = "n-v-c-i:block"

vim.cmd("filetype plugin indent on")
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.clipboard:append("unnamedplus")

vim.opt.fillchars = { fold = " " }
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.opt.conceallevel = 3

vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

vim.keymap.set("x", "p", "pgvy", { noremap = true })

-- Copilot settings
-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
-- vim.g.copilot_tab_fallback = ""
-- vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
