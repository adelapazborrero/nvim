local present, telescope = pcall(require, 'telescope')

if not present then
    return
end

telescope.setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
        },
        prompt_prefix = '   ',
        selection_caret = '  ',
        entry_prefix = '  ',
        initial_mode = 'insert',
        selection_strategy = 'reset',
        sorting_strategy = 'ascending',
        layout_strategy = 'horizontal',
        layout_config = {
            horizontal = {
                prompt_position = 'top',
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        file_sorter = require('telescope.sorters').get_fuzzy_file,
        file_ignore_patterns = { 'node_modules' },
        generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
        path_display = { 'truncate' },
        winblend = 0,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        --borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
        color_devicons = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
        mappings = {
            n = {
                ['q'] = require('telescope.actions').close,
            },
            i = {
                ['<ESC>'] = require('telescope.actions').close,
            },
        },
    },
    pickers = {
        find_files = {
            --theme = "dropdown",
        },
    },
}

vim.api.nvim_set_keymap(
    'n',
    ';f',
    ":lua require('telescope.builtin').find_files()<CR>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    'n',
    ';r',
    ":lua require('telescope.builtin').live_grep()<CR>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    'n',
    ';;',
    ":lua require('telescope.builtin').grep_string()<CR>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    'n',
    '\\\\',
    ":lua require('telescope.builtin').help_tags()<CR>",
    { noremap = true, silent = true }
)

vim.g.theme_switcher_loaded = true
