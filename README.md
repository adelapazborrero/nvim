## Personal neovim settings. Clone this in case settings are needed.

- Install packer
  `https://github.com/wbthomason/packer.nvim`

  | Notes: If nvim-norg compilation gives error in arm64 consider installing gcc-11 and running the following `CC=gcc-11 nvim -c "TSInstall norg"`

  ![Screenshot](./src/Screenshot.png)

## Recommended npm global packages

- @fsouza/prettierd _installed through npm_
- stylua _installed as package depending on os_
- php-cs-fixer _installed through composer_

## Recommended Treesitter languages

- vue
- lua
- typescript
- vue _scheme has been added to support script tags_
- html
- css
- javascript
- scss
- tsx

### If telescope running slow make sure to have this dependencies installed

- fd
- plocate or locate ( findutils )
- bat

For python it is better to run pip3 istall --upgrade neovim
