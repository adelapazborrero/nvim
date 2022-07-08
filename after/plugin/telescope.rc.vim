nnoremap <silent> ;f <cmd>Telescope find_files hidden=true previewer=false theme=dropdown prompt_prefix=🔍 layout_config={height=0.50} border={} file_ignore_patterns={"node_modules","git"} path_display={"truncate"} set_env={["COLORTERM"]="truecolor"} vimgrep_arguments={"rg","--color=never","--no-heading"}<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

lua <<EOF

local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
        file_ignore_patterns = {
            "node_modules",
            "git"
        },
        mappings = {
            n = {
                ["q"] = actions.close
            },
        },
        pickers = {
            find_files = {
                theme = "dropdown",
                previewer = false,
            },
            file_browser = {
                previewer = false,
            }
        }
    }
}

EOF
