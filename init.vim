" http://vimdoc.sourceforge.net/htmldoc/usr_41.html#script
" http://vimdoc.sourceforge.net/htmldoc/if_lua.html#Lua

source ~/.config/nvim/config-plugins/baseconfig.vim

packadd! gruvbox

set bg=dark
colorscheme gruvbox

packadd! vim-airline 
let g:airline_statusline_ontop=1

lua require'lsp.lsp-config'

"source ~/.config/nvim/config-plugins/rnvimr.vim
"source ~/.config/nvim/config-plugins/nvim-lspconfig.vim
"source ~/.config/nvim/config-plugins/completion-nvim.vim
"source ~/.config/nvim/config-plugins/nvim-treesitter.vim
"source ~/.config/nvim/config-plugins/completion-treesitter.vim
"source ~/.config/nvim/config-plugins/vim-gitgutter.vim

nnoremap <plug>(test-hi) :<c-u>call test#hello#hi()<cr>
nmap <silent> <F9> <plug>(test-hi) 
