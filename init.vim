" Fundamentals "{{{ -------------------------------------------------------------------- 
" init autocmd autocmd!  set script encoding scriptencoding utf-8 stop loading config if it's on tiny or small if !1 | finish | endif set nocompatible set number
"syntax enable
" set langmenu=ja_JP
let $LANG = 'ja_JP'
set fileencodings=utf-8,sjis,euc-jp,latin
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
nnoremap <C-m> :noh<CR>

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
set mat=2
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
let g:jsx_ext_required = 1

" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"}}}

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
" au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
" au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md,.vue

augroup typescriptreact                                                          
  au!                                                                            
  autocmd BufNewFile,BufRead *.tsx   set filetype=typescript                     
  autocmd BufNewFile,BufRead *.tsx   set filetype=javascript                     
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
"}}}

" Syntax theme "{{{
" ---------------------------------------------------------------------

autocmd vimenter * ++nested colorscheme solarized8
let g:solarized_termtrans = 1

" colorscheme iceberg
" colorscheme gruvbox
" colorscheme nord
set background=dark

let g:airline#extensions#tabline#enabled = 1

"Transparent background"
" hi Normal guibg=NONE ctermbg=NONE

" Javascript pretty colorful highlight
" let g:vim_jsx_pretty_colorful_config = 1
"}}}

" Highlights "{{{
" ---------------------------------------------------------------------
set cursorline
"set cursorcolumn

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=44 guifg=#2b506e guibg=#183E4A

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

autocmd FileType coffee setlocal shiftwidth=4 tabstop=4
autocmd FileType ruby setlocal shiftwidth=4 tabstop=4
autocmd FileType yaml setlocal shiftwidth=4 tabstop=4
autocmd FileType php setlocal shiftwidth=4 tabstop=4
autocmd FileType js setlocal shiftwidth=2 tabstop=2
autocmd FileType ts setlocal shiftwidth=2 tabstop=2
autocmd FileType tsx setlocal shiftwidth=2 tabstop=2
autocmd FileType vue setlocal shiftwidth=2 tabstop=2

let g:indentLine_setColors = 0
let g:indentLine_enabled = 0

nnoremap <C-i> :IndentLinesToggle<CR>

"}}}

" Custorm shortcuts"{{{
" ---------------------------------------------------------------------

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-p> :bd<CR>
nnoremap ;g  :Gvdiffsplit<CR>
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

" let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
" let g:nvim_tree_gitignore = 1 
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_indent_markers = 1 
" let g:nvim_tree_hide_dotfiles = 0 
let g:nvim_tree_git_hl = 1 
let g:nvim_tree_highlight_opened_files = 1 
let g:nvim_tree_root_folder_modifier = ':~' 
let g:nvim_tree_add_trailing = 1
let g:nvim_tree_group_empty = 1
let g:nvim_tree_disable_window_picker = 1
let g:nvim_tree_icon_padding = ' ' 
let g:nvim_tree_symlink_arrow = ' >> ' 
let g:nvim_tree_respect_buf_cwd = 1 
let g:nvim_tree_create_in_closed_folder = 0
let g:nvim_tree_refresh_wait = 500 
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'notify',
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } 
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 0,
    \ }

let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus and NvimTreeResize are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

"}}}

" Airline Settings "{{{
" ---------------------------------------------------------------------
" air-line
let g:airline_powerline_fonts = 1
" let g:airline_theme='papercolor'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"}}}

" Dashboard Settings"{{{
" ---------------------------------------------------------------------
let g:dashboard_default_executive ='telescope'
let g:dashboard_custom_shortcut={
\ 'find_file'          : 'SPC f f',
\ 'find_history'       : 'SPC f h',
\ 'change_colorscheme' : 'SPC t c',
\ 'new_file'           : 'SPC c n',
\ 'last_session'       : 'SPC s l',
\ 'find_word'          : 'SPC f a',
\ 'book_marks'         : 'SPC f b',
\ }

let g:dashboard_custom_header = [
    \'',
    \'   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ',
    \'    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ',
    \'          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     ',
    \'           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ',
    \'          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ',
    \'   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ',
    \'  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ',
    \' ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ',
    \' ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ ',
    \'      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ',
    \'       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ',
    \'     ⢰⣶  ⣶ ⢶⣆⢀⣶⠂⣶⡶⠶⣦⡄⢰⣶⠶⢶⣦  ⣴⣶     ',
    \'     ⢸⣿⠶⠶⣿ ⠈⢻⣿⠁ ⣿⡇ ⢸⣿⢸⣿⢶⣾⠏ ⣸⣟⣹⣧    ',
    \'     ⠸⠿  ⠿  ⠸⠿  ⠿⠷⠶⠿⠃⠸⠿⠄⠙⠷⠤⠿⠉⠉⠿⠆   ',
    \'',
    \]

let g:dashboard_custom_footer = [
    \'アベル  NVIM ターミナル' 
    \]

"}}}

" Settings for Http request"{{{
" ---------------------------------------------------------------------
let g:vim_http_split_vertically = 1
let g:vim_http_tempbuffer = 1

"}}}

let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }
" vim: set foldmethod=marker foldlevel=0:i
