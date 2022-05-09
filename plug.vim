if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

if has("nvim")
  "" Test and Debug
  Plug 'puremourning/vimspector'

  "" Configuration
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'roxma/nvim-yarp'
  Plug 'glepnir/dashboard-nvim'

  "" Typescript React support
  " Plug 'peitalin/vim-jsx-typescript'
  Plug 'leafgarland/typescript-vim'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'ianks/vim-tsx'

  "" Development plugins
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'alvan/vim-closetag'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'karb94/neoscroll.nvim'
  Plug 'Yggdroot/indentLine' " Comment this out for initial screen
  Plug 'nicwest/vim-http'
  Plug 'tpope/vim-surround'
  Plug 'mileszs/ack.vim'
  Plug 'pantharshit00/vim-prisma'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

  "" Lua plugins 
  Plug 'hoob3rt/lualine.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'norcalli/snippets.nvim'

  "" Vuejs plugins and language servers
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'neoclide/coc-vetur'
  Plug 'ncm2/ncm2'
  Plug 'ncm2/ncm2-jedi'
  Plug 'ncm2/ncm2-path'

  "" Themes
  Plug 'nvim-lualine/lualine.nvim'
  " Plug 'vim-airline/vim-airline'
  " Plug 'vim-airline/vim-airline-themes'

  ""Auto completion plugin
  Plug 'nvim-lua/completion-nvim'
  
  ""Javascript and React plugins
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'

  "" Themes 
  Plug 'arcticicestudio/nord-vim'
  Plug 'morhetz/gruvbox'
  Plug 'cocopon/iceberg.vim'
  Plug 'lifepillar/vim-solarized8'
  Plug 'overcache/NeoSolarized'
  Plug 'chriskempson/base16-vim'
  Plug 'mhartington/oceanic-next'
  Plug 'EdenEast/nightfox.nvim'
  Plug 'akinsho/bufferline.nvim', { 'tag': '*' }


  " LSP Config
  Plug 'folke/lsp-colors.nvim'
  Plug 'neovim/nvim-lspconfig'
  " Plug 'glepnir/lspsaga.nvim'
  Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'

endif

Plug 'tpope/vim-commentary'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'kchmck/vim-coffee-script', {'for': 'coffee' }

call plug#end() 
