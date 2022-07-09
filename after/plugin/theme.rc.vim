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
