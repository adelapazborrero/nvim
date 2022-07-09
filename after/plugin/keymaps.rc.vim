nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

noremap fn :noh<CR>
noremap ff :NvimTreeFindFile<CR>
" nnoremap <C-h> :bprevious<CR>
" nnoremap <C-l> :bnext<CR>
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
