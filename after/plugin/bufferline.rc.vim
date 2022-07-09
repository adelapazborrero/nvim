lua << EOF
require("bufferline").setup{
  options = {
    separator_style = "thick", -- slant, padded_slant, thick, thin
    numbers = "ordinal",
    --indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    offsets = {{filetype = "NvimTree", text = "構造", text_align = "center"}},
    color_icons = true, -- whether or not to add the filetype icon highlights
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
    show_close_icon = true,
    show_tab_indicators = true,
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    tab_size = 20,
    highlights = {
      tab = { 
        guifg = '#ffffff',
        guibg = '#ffffff'
      },
      tab_selected = {
        guifg = "#ffffff",
        guibg = "#ffffff",

      }
    }
--    diagnostics = 'coc',
--    diagnostics_indicator = function(count, level, diagnostics_dict, context)
--      local s = " "
--      for e, n in pairs(diagnostics_dict) do
--        local sym = e == "error" and "  "
--          or (e == "warning" and "  " or " " )
--        s = s .. n .. sym
--      end
--      return s
--    end,
  }
}
EOF

nnoremap <silent><C-h> :BufferLineCyclePrev<CR>
nnoremap <silent><C-l> :BufferLineCycleNext<CR>

nnoremap <silent>bh :BufferLineMovePrev<CR>
nnoremap <silent>bl :BufferLineMoveNext<CR>
