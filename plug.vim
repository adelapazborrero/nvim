if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

if has("nvim")
  "" Configuration
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'roxma/nvim-yarp'

  "" Development plugins
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'alvan/vim-closetag'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'karb94/neoscroll.nvim'
  Plug 'Yggdroot/indentLine'

  "" Lua plugins 
  Plug 'hoob3rt/lualine.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'

  "" Vuejs plugins and language servers
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'puremourning/vimspector'
  Plug 'neoclide/coc-vetur'
  Plug 'ncm2/ncm2'
  Plug 'ncm2/ncm2-jedi'
  Plug 'ncm2/ncm2-path'

  ""Airline plugins
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  ""Auto completion plugin
  Plug 'nvim-lua/completion-nvim'
  " Plug 'hrsh7th/cmp-nvim-lsp'
  " Plug 'hrsh7th/cmp-buffer'
  " Plug 'hrsh7th/cmp-path'
  " Plug 'hrsh7th/cmp-cmdline'
  " Plug 'hrsh7th/nvim-cmp'
  
  ""Javascript and React plugins
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'

  "" Colorschemes
  Plug 'arcticicestudio/nord-vim'
  Plug 'morhetz/gruvbox'
  Plug 'folke/lsp-colors.nvim'
endif

Plug 'tpope/vim-commentary'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'kchmck/vim-coffee-script', {'for': 'coffee' }

call plug#end() 
