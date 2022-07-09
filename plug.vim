if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

if has("nvim")
    "" IDE
    Plug 'puremourning/vimspector'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'windwp/nvim-autopairs' 
    Plug 'alvan/vim-closetag'
    Plug 'olimorris/persisted.nvim'
    Plug 'mileszs/ack.vim'
    Plug 'lukas-reineke/indent-blankline.nvim'

    "" Language support
    Plug 'leafgarland/typescript-vim'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'ianks/vim-tsx'
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'
    Plug 'roxma/nvim-yarp'

    "" Utils
    Plug 'nvim-lua/completion-nvim'
    Plug 'karb94/neoscroll.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'norcalli/snippets.nvim'
    Plug 'NvChad/nvterm'
    Plug 'sindrets/diffview.nvim'

    "" Installers
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ncm2/ncm2'
    Plug 'ncm2/ncm2-jedi'
    Plug 'ncm2/ncm2-path'

  "" UI
    Plug 'lifepillar/vim-colortemplate'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'hoob3rt/lualine.nvim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'morhetz/gruvbox'
    Plug 'cocopon/iceberg.vim'
    Plug 'lifepillar/vim-solarized8'
    Plug 'overcache/NeoSolarized'
    Plug 'chriskempson/base16-vim'
    Plug 'mhartington/oceanic-next'
    Plug 'EdenEast/nightfox.nvim'
    Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }
    Plug 'kristijanhusak/vim-hybrid-material'
    Plug 'rakr/vim-one'


    " LSP Config
    Plug 'folke/lsp-colors.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'

endif

Plug 'tpope/vim-commentary'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'kchmck/vim-coffee-script', {'for': 'coffee' }

call plug#end() 
