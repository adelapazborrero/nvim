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
set backupskip=/tmp/*,/private/tmp/*
set number 
set termguicolors

:set mouse=a
set t_Co=256

if has('nvim')
  set inccommand=split
endif

set nosc noru nosm
set lazyredraw
set showmatch
" set mat=2
set ignorecase
set smarttab
set backspace=start,eol,indent
set path+=**
set wildignore+=*/node_modules/*
autocmd InsertLeave * set nopaste
set formatoptions+=r
let g:jsx_ext_required = 2

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

lua <<EOF
require'toggle_lsp_diagnostics'.init({start_on = false})
require('nvim-autopairs').setup{}
require('setup.git-diff')
require('setup.nvim-tree')
require('setup.neoscroll')
require('setup.persisted-session')
require('setup.telescope')
require('setup.bufferline')
require('setup.dev-icons')
require('setup.git-signs')
require('setup.lualine')
require('setup.nvterm')
require('theme')

EOF

let g:completion_enable_snippet='snippets.nvim'

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

filetype plugin indent on
set shiftwidth=4
set tabstop=4
set ai 
set si
set nowrap

let g:indentLine_setColors = 1
let g:indentLine_enabled = 1

"}}}

" Extras "{{{
" ---------------------------------------------------------------------
set exrc
autocmd BufEnter * call ncm2#enable_for_buffer()
command! -nargs=0 Prettier :CocCommand prettier.formatFile
"}}}
"
set completeopt=menu,menuone,noselect

set clipboard+=unnamedplus
vnoremap <A-c> "+y
vnoremap <A-v> "+p

" vim: set foldmethod=marker foldlevel=0:i
