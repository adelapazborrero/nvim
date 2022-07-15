local present, persisted = pcall(require, "persisted")

if not present then
   return
end

persisted.setup({
    save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- directory where session files are saved
    command = "VimLeavePre", -- the autocommand for which the session is saved
    use_git_branch = false, -- create session files based on the branch of the git enabled repository
    autosave = true, -- automatically save session files when exiting Neovim
    autoload = true, -- automatically load the session for the cwd on Neovim startup
    allowed_dirs = nil, -- table of dirs that the plugin will auto-save and auto-load from
    ignored_dirs = nil, -- table of dirs that are ignored when auto-saving and auto-loading
    before_source = function()
        --vim.api.nvim_input("<ESC>:NvimTreeClose<CR>")
    end,
    before_save = function()
        pcall(vim.cmd, 'NvimTreeClose')
    end,
    after_save = function()
        -- pcall(vim.cmd, ':NvimTreeClose')
        vim.cmd 'NvimTreeClose'
    end,
    after_source = nil, -- function to run after the session is sourced
    telescope = { -- options for the telescope extension
        before_source = nil, -- function to run before the session is sourced via telescope
        after_source = nil, -- function to run after the session is sourced via telescope
    },
})
