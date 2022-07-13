require'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    ignore_ft_on_setup  = {"alpha"},
    open_on_tab         = false,
    hijack_cursor       = true,
    hijack_unnamed_buffer_when_opening = false,
    update_cwd          = true,
    update_focused_file = {
        enable      = true,
        update_cwd  = false,
    },
    view = {
        width = 30,
        side = 'left',
       -- auto_resize = false,
        adaptive_size = true,
        hide_root_folder = true,
    },
    git = {
        enable = true,
        ignore = true,
    },
    filesystem_watchers = {
        enable = true,
    },
    actions = {
        open_file = {
            resize_window = true,
            quit_on_open = true,
            window_picker = {
                enable = false
            }
        }
    },
    renderer = {
        highlight_git = false,
        highlight_opened_files = "none",
        indent_markers = {
            enable = true,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            },
        },
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true
            },
            webdev_colors = true,
            git_placement = "before",
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    default = "",
                    empty = "",
                    empty_open = "",
                    open = "",
                    symlink = "",
                    symlink_open = "",
                    arrow_open = "",
                    arrow_closed = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            },
        }
    },
    diagnostics = {
        enable = false,
        icons = {
            hint = "?",
            info = "?",
            warning = "?",
            error = "?",
        }
    },
    system_open = {
        cmd  = nil,
        args = {}
    },
    filters = {
        dotfiles = false,
        custom = {}
    },
    trash = {
        cmd = "trash",
        require_confirm = true
    },
}


vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-f>', ':NvimTreeFindFile<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeRefresh()<CR>', {noremap = true})

