" Fundamentals "{{{ 
" -------------------------------------------------------------------- 
"
" init autocmd autocmd!  set script encoding scriptencoding utf-6 stop loading config if it's on tiny or small if !2 | finish | endif set nocompatible set number
" syntax enable
" set langmenu=ja_JP
" let $LANG = 'ja_JP'
" set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=UTF-8
set title
set autoindent
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab
"let loaded_matchparen = 1
set backupskip=/tmp/*,/private/tmp/*
set number

:set mouse=a
set t_Co=256

if has('nvim')
  set inccommand=split
endif

set nosc noru nosm
" Don't redraw while executng macros (good performance config)
set lazyredraw
set showmatch
" How many tenths of a second to blink when matching brackets
" set mat=2
" Ignore case when searching
set ignorecase
" Be smart when using tabs ;)
set smarttab
" indents
filetype plugin indent on
set shiftwidth=2
set tabstop=4
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent

" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Add asterisks in block comments
set formatoptions+=r
let g:jsx_ext_required = 2

" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" }}}

" Autoclosing HTML tags "{{{
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.blade.php'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_emptyTags_caseSensitive = 1

let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

let g:closetag_shortcut = '>'

let g:closetag_close_shortcut = '<leader>>'

" }}}

" File types "{{{
" ---------------------------------------------------------------------
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md,.vue

augroup typescriptreact                                                          
  au!                                                                            
  autocmd BufNewFile,BufRead *.tsx   set filetype=typescriptreact
  autocmd BufNewFile,BufRead *.tsx   set filetype=javascript
augroup END

augroup SyntaxSettings
  autocmd!
  autocmd BufNewFile, BufRead *.tsx set filetype=typescript
augroup END 


let g:vim_json_conceal=0

"}}}

" Imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim
if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif

runtime ./maps.vim

lua <<EOF
require'toggle_lsp_diagnostics'.init({start_on = false})
require('neoscroll').setup()
--require'lspconfig'.vuels.setup{}
require'nvim-web-devicons'.setup{
--  override = {
--    vue = {
--      icon = "﵂",
--      name = "Vue"
--    }
--  }
}
require('nvim-autopairs').setup{}
EOF
" let g:coc_diagnostic_disable = 1
let g:completion_enable_snippet='snippets.nvim'

"}}}

" Syntax theme "{{{
" ---------------------------------------------------------------------
set background=dark

" colorscheme iceberg
" colorscheme gruvbox
" colorscheme nord
" colorscheme base16-default-dark
" colorscheme OceanicNext
" colorscheme nordfox
" colorscheme NeoSolarized
" colorscheme hybrid_material
colorscheme one 
let g:one_allow_italics = 1
let g:enable_italic_font = 1
"
" colorscheme material
" let g:material_theme_style = 'ocean' " 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
" let g:material_terminal_italics = 1


"Transparent background"
" hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=#2c3b41 ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi CursorLineNr cterm=NONE guifg=NONE guibg=#2c3b41
hi CursorLine cterm=NONE guifg=NONE guibg=#2c3b41
hi EndOfBuffer guibg=NONE ctermbg=NONE

" highlight NvimTreeFolderIcon guifg=#50727C

hi! CocErrorSign guifg=#cc6666
hi! CocInfoSign guibg=#268BD2
hi! CocWarningSign guifg=#D33682
autocmd vimenter * ++nested highlight LineNr cterm=NONE guifg=grey guibg=#2c3b41

" highlight CocFloating ctermbg=color
" highlight CocErrorFloat ctermfg=color

" Neosolarized variables
" autocmd vimenter * ++nested colorscheme solarized8
" autocmd vimenter * ++nested highlight LineNr cterm=NONE guifg=#50727C guibg=#043542
" autocmd vimenter * ++nested highlight CursorLineNr cterm=NONE guifg=NONE guibg=#043542
" autocmd vimenter * ++nested highlight NvimTreeFolderIcon guifg=#238BD2

" autocmd vimenter * ++nested hi! CocErrorSign guifg=#cb4b16
" autocmd vimenter * ++nested hi! CocInfoSign guibg=#268BD2
" autocmd vimenter * ++nested hi! CocWarningSign guifg=#D33682

" let g:solarized_termtrans = 1
" let g:solarized_extra_hi_groups = 1

set guifont="Hack Nerd Font"

"
"}}}

" Highlights "{{{
" ---------------------------------------------------------------------
set cursorline
"set cursorcolumn
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40
highlight LineNr cterm=NONE ctermfg=236 guifg=#4C566A guibg=#3B4252

" Set cursor line color on visual mode

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

"}}}

" Tabs settings "{{{
" ---------------------------------------------------------------------

" autocmd FileType coffee setlocal shiftwidth=4 tabstop=4
" autocmd FileType ruby setlocal shiftwidth=4 tabstop=4
" autocmd FileType yaml setlocal shiftwidth=4 tabstop=4
" autocmd FileType php setlocal shiftwidth=4 tabstop=4
" autocmd FileType js setlocal shiftwidth=4 tabstop=4
" autocmd FileType ts setlocal shiftwidth=4 tabstop=4
" autocmd FileType tsx setlocal shiftwidth=4 tabstop=4
" autocmd FileType vue setlocal shiftwidth=4 tabstop=4
" autocmd FileType json setlocal shiftwidth=4 tabstop=4

set shiftwidth=4

let g:indentLine_setColors = 1
let g:indentLine_enabled = 1

"}}}

" Custorm shortcuts"{{{
" ---------------------------------------------------------------------

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

noremap fi :IndentLinesToggle<CR>
noremap fn :noh<CR>
noremap ff :NvimTreeFindFile<CR>
nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-p> :bd<CR>
nnoremap ;g  :Gvdiffsplit<CR>
nnoremap gs  :G<CR>
nnoremap gl  :Gclog<CR>
nnoremap fh  :diffget //2<CR>
nnoremap fl  :diffget //3<CR>
nnoremap [q  :cprev<CR>
nnoremap ]q  :cnext<CR>

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" nnoremap hg  :q<CR>

"}}}

" Extras "{{{
" ---------------------------------------------------------------------
set exrc
autocmd BufEnter * call ncm2#enable_for_buffer()
command! -nargs=0 Prettier :CocCommand prettier.formatFile
"}}}

" Tree settings "{{{
" ---------------------------------------------------------------------

autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif

lua << EOF
require'nvim-tree'.setup {
  disable_netrw       = false,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = false,
    auto_open = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
      window_picker = {
        enable = false    
      }
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
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },  
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
    }
  },
  view = {
    width = 30,
    height = 30,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    }
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}


EOF

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

set termguicolors " this variable must be enabled for colors to be applied properly

"}}}

" Bufferline"{{{
" ---------------------------------------------------------------------

lua << EOF
require("bufferline").setup{
  options = {
    separator_style = "thin", -- slant, padded_slant, thick, thin
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

"}}}

" Persisted sessions "{{{

lua << END
require("persisted").setup({
  save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- directory where session files are saved
  command = "VimLeavePre", -- the autocommand for which the session is saved
  use_git_branch = false, -- create session files based on the branch of the git enabled repository
  autosave = true, -- automatically save session files when exiting Neovim
  autoload = true, -- automatically load the session for the cwd on Neovim startup
  allowed_dirs = nil, -- table of dirs that the plugin will auto-save and auto-load from
  ignored_dirs = nil, -- table of dirs that are ignored when auto-saving and auto-loading
  before_save = nil, -- function to run before the session is saved to disk
  after_save = nil, -- function to run after the session is saved to disk
  after_source = nil, -- function to run after the session is sourced
  telescope = { -- options for the telescope extension
    before_source = nil, -- function to run before the session is sourced via telescope
    after_source = nil, -- function to run after the session is sourced via telescope
  },
})
END

" }}}

" Git Signs "{{{

lua << END
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}
END

" }}}

" Lua Line"{{{
" ---------------------------------------------------------------------
lua << END
require('lualine').setup({
  options = {
    icons_enabled = true,
    --theme = 'solarized_dark',
    theme = 'auto',
    --component_separators = { left = '', right = ''},
    --section_separators = { left = '', right = ''},
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    --section_separators = { left = ' ', right = ' ' },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
})
END

"}}}

" Settings for Http request"{{{
" ---------------------------------------------------------------------
let g:vim_http_split_vertically = 1
let g:vim_http_tempbuffer = 1

"}}}

set clipboard+=unnamedplus
vnoremap <A-c> "+y
vnoremap <A-v> "+p

let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }
" vim: set foldmethod=marker foldlevel=0:i
