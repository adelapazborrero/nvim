vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'

    -- IDE
    use 'puremourning/vimspector'
    use 'lewis6991/gitsigns.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'kyazdani42/nvim-tree.lua'
    use 'windwp/nvim-autopairs'
    use 'olimorris/persisted.nvim'
    use 'lukas-reineke/indent-blankline.nvim'

    -- Language support
    use 'leafgarland/typescript-vim'
    use 'HerringtonDarkholme/yats.vim'
    use 'ianks/vim-tsx'
    use 'pangloss/vim-javascript'
    use 'mxw/vim-jsx'
    use 'roxma/nvim-yarp'

    -- Utils
    use 'karb94/neoscroll.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'norcalli/snippets.nvim'
    use 'NvChad/nvterm'
    use 'sindrets/diffview.nvim'
    use 'tpope/vim-commentary'
    use 'github/copilot.vim'

    -- Installers
    -- use {'neoclide/coc.nvim', branch = 'release'}
    use 'ncm2/ncm2'
    use 'ncm2/ncm2-jedi'
    use 'ncm2/ncm2-path'

    -- UI
    use 'kyazdani42/nvim-web-devicons'
    use 'hoob3rt/lualine.nvim'
    use 'arcticicestudio/nord-vim'
    use 'morhetz/gruvbox'
    use 'cocopon/iceberg.vim'
    use 'lifepillar/vim-solarized8'
    use 'overcache/NeoSolarized'
    use 'chriskempson/base16-vim'
    use 'mhartington/oceanic-next'
    use 'EdenEast/nightfox.nvim'
    use {'akinsho/bufferline.nvim',  tag = '*' }
    use {'kaicataldo/material.vim',  branch = 'main' }
    use 'kristijanhusak/vim-hybrid-material'
    use 'rakr/vim-one'

    -- LSP Config
    use 'folke/lsp-colors.nvim'
    use 'neovim/nvim-lspconfig'
    use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
    use 'williamboman/nvim-lsp-installer'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'onsails/lspkind.nvim'

    use 'leafOfTree/vim-vue-plugin'

    use 'groenewege/vim-less'
    use 'kchmck/vim-coffee-script'

end)
