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

-- Only on GNOME/Wayland: Mutter implements no data-control protocol, so every
-- wl-copy/wl-paste call creates a real toplevel window to touch the selection,
-- which o-tiling then tiles -- the screen flickers on each yank. Route through
-- xsel (XWayland) instead: X11 selection ownership uses an unmapped window that
-- GNOME never composites. Everywhere else, Neovim's own detection is left alone
-- (pbcopy on macOS, win32yank on Windows, wl-clipboard on wlroots).
local on_gnome_wayland = vim.fn.has("linux") == 1
    and (vim.env.WAYLAND_DISPLAY or "") ~= ""
    and (vim.env.XDG_CURRENT_DESKTOP or ""):lower():find("gnome") ~= nil

if on_gnome_wayland and vim.fn.executable("xsel") == 1 then
    -- A shell can inherit XAUTHORITY from a previous session, and Mutter picks
    -- a new cookie filename on every login, so the path may point at a deleted
    -- file -- xsel then fails with "Authorization required". Resync it.
    if vim.env.XAUTHORITY == nil or vim.fn.filereadable(vim.env.XAUTHORITY) == 0 then
        local runtime_dir = vim.env.XDG_RUNTIME_DIR or ("/run/user/" .. vim.uv.getuid())
        local cookies = vim.fn.glob(runtime_dir .. "/.mutter-Xwaylandauth.*", true, true)
        if #cookies > 0 then
            vim.env.XAUTHORITY = cookies[1]
        end
    end

    vim.g.clipboard = {
        name = "xsel",
        copy = {
            ["+"] = { "xsel", "--nodetach", "-i", "-b" },
            ["*"] = { "xsel", "--nodetach", "-i", "-p" },
        },
        paste = {
            ["+"] = { "xsel", "-o", "-b" },
            ["*"] = { "xsel", "-o", "-p" },
        },
        cache_enabled = 1,
    }
end

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
