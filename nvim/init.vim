" http://vimdoc.sourceforge.net/htmldoc/usr_41.html#script
" http://vimdoc.sourceforge.net/htmldoc/if_lua.html#Lua
"
let mapleader = ","
noremap <leader>, <ESC>
inoremap <leader>, <ESC>
cnoremap <leader>, <c-u><ESC>
vnoremap <leader>, <ESC>
xnoremap <leader>, <c-u><ESC>
tnoremap <leader>, <c-\><c-n>

nnoremap <leader>w <ESC>:w<cr>
inoremap <leader>w <ESC>:w<cr>

nnoremap <leader>x <ESC>:x<cr>
inoremap <leader>x <ESC>:x<cr>

nnoremap <leader>q <ESC>:q<cr>
inoremap <leader>q <ESC>:q<cr>
tnoremap <leader>q <c-\><c-n>:q<cr>
nnoremap <leader>0 <ESC>:q!<cr>
inoremap <leader>0 <ESC>:q!<cr>
tnoremap <leader>0 <c-\><c-n>:q!<cr>

nnoremap <leader>h <ESC>:w<cr><c-w>h
inoremap <leader>h <ESC>:w<cr><c-w>h
tnoremap <leader>h <c-\><c-n>:winc h<cr>
" tnoremap <leader>h <c-w>h

nnoremap <leader>H <ESC>:w<cr><c-w>H
inoremap <leader>H <ESC>:w<cr><c-w>H
tnoremap <leader>H <c-\><c-n>:winc H<cr>
" tnoremap <leader>H <c-w>H

nnoremap <leader>j <ESC>:w<cr><c-w>j
inoremap <leader>j <ESC>:w<cr><c-w>j
tnoremap <leader>j <c-\><c-n>:winc j<cr>

nnoremap <leader>J <ESC>:w<cr><c-w>J
inoremap <leader>J <ESC>:w<cr><c-w>J
tnoremap <leader>J <c-\><c-n>:winc J<cr>

nnoremap <leader>k <ESC>:w<cr><c-w>k
inoremap <leader>k <ESC>:w<cr><c-w>k
tnoremap <leader>k <c-\><c-n>:winc k<cr>

nnoremap <leader>K <ESC>:w<cr><c-w>K
inoremap <leader>K <ESC>:w<cr><c-w>K
tnoremap <leader>K <c-\><c-n>:winc K<cr>

nnoremap <leader>l <ESC>:w<cr><c-w>l
inoremap <leader>l <ESC>:w<cr><c-w>l
tnoremap <leader>l <c-\><c-n>:winc l<cr>

nnoremap <leader>L <ESC>:w<cr><c-w>L
inoremap <leader>L <ESC>:w<cr><c-w>L
tnoremap <leader>L <c-\><c-n>:winc L<cr>

nnoremap <leader>f <c-w>_
inoremap <leader>f <c-w>_
tnoremap <leader>f <c-\><c-n><c-w>_

nnoremap <leader>v <c-w>|
inoremap <leader>v <c-w>|
tnoremap <leader>v <c-\><c-n><c-w>|

nnoremap <leader>e <c-w>=
inoremap <leader>e <c-w>=
tnoremap <leader>e <c-\><c-n><c-w>=

"set splitright
"set splitbelow

nnoremap <leader>n <ESC>:w<cr>:botright new<space>
inoremap <leader>n <ESC>:w<cr>:botright new<space>
tnoremap <leader>n <c-\><c-n>:botright new<space>

nnoremap <leader>t <ESC>:w<cr>:tabnew<space>
inoremap <leader>t <ESC>:w<cr>:tabnew<space>
tnoremap <leader>t <c-\><c-n>:tabnew<space>

nnoremap <leader>N <ESC>:w<cr>:botright vnew<space>
inoremap <leader>N <ESC>w<cr>:botright vnew<space>
tnoremap <leader>N <c-\><c-n>:botright vnew<space>

nnoremap <leader>b <ESC>:w<cr>:new term://bash<cr>icd build<cr>
inoremap <leader>b <ESC>:w<cr>:new term://bash<cr>icd build<cr>
tnoremap <leader>b <c-\><c-n>:new term://bash<cr>icd build<cr>
nnoremap <leader>B <ESC>:w<cr>:vnew term://bash<cr>
inoremap <leader>B <ESC>:w<cr>:vnew term://bash<cr>
tnoremap <leader>B <c-\><c-n>:vnew term://bash<cr>

nnoremap <leader>c <ESC>:botright new term://bash<cr>icd build && ccmake ..<cr>
inoremap <leader>c <ESC>:botright new term://bash<cr>icd build && ccmake ..<cr>
tnoremap <leader>c <c-u>cd $bh && ccmake ..<cr>
nnoremap <leader>m <ESC>:botright new term://bash<cr>icd build && make -j4<cr>
inoremap <leader>m <ESC>:botright new term://bash<cr>icd build && make -j4<cr>
tnoremap <leader>m <c-u>cd build && make -j4<cr>

noremap <leader>1 <ESC>:botright new $th/term.md<cr>
noremap <leader>2 <ESC>:botright new $nh/init.vim<cr>
noremap <leader>3 <ESC>:botright new ~/.bashrc<cr>
noremap <leader>s <ESC>:w<cr>:so %<cr>
inoremap <leader>1 <ESC>:botright new $th/term.md<cr>
inoremap <leader>2 <ESC>:botrigth new $nh/init.vim<cr>
inoremap <leader>s <ESC>:so %<cr>
tnoremap <leader>1 <c-\><c-n>:botright new $th/term.md<cr>
tnoremap <leader>2 <c-\><c-n>:botright new $nh/init.vim<cr>
set nu rnu

" Set completeopt to have a better completion experience:s:
set completeopt=menuone,noinsert,noselect
set complete=.,b,u,t,i
set complete+=kspell
" Avoid showing message extra message when using completion
set shortmess+=c

set smartindent
set tabstop=3 softtabstop=3 sw=3
set cmdheight=2
set updatetime=50
set signcolumn=yes
set nowrap

"------------------------"
""      clang-chek      "
"------------------------"
" a buffer : s a in memory text of a file
" a window : is a viewport on a buffer
" a tab page   : is a collection of windows
" http://vimdoc.sourceforge.net/htmldoc/windows.html#window
" states of buffer
"   active:
"   hedden:
"   inactive: does not contaion anything
"
" kinds of buffer
"   quckfix buffer window
"       :cwindow (cw) column window
"
" autowrite
"   Write the contents of the file, if it has been modified, 
"
" wall 
"   Write all changed buffers. 
"
" cc
"	display error
"
" % : current file name
"
" & : repeat last substitution with same search pattern
"
" expand(arg)
"	
function! ClangCheckImpl(cmd)
  if &autowrite | wall | endif

  echo "Running " . a:cmd . " ..."

  let l:output = system(a:cmd)
  cexpr l:output
  cwindow
  let w:quickfix_title = a:cmd
  if v:shell_error != 0
    cc
  endif
  let g:clang_check_last_cmd = a:cmd
endfunction

function! ClangCheck()
  let l:filename = expand('%')
  if l:filename =~ '\.\(cpp\|cxx\|cc\|c\)$'
    call ClangCheckImpl("clang-check " . l:filename)
  elseif exists("g:clang_check_last_cmd")
    call ClangCheckImpl(g:clang_check_last_cmd)
  else
    echo "Can't detect file's compilation arguments and no previous clang-check invocation!"
  endif
endfunction

nmap <silent> <F5> :call ClangCheck()<CR><CR>
" ---------- end of clang-check -------------- "
packadd! gruvbox
set bg=dark
colorscheme gruvbox

packadd! vim-airline 

source ~/.config/nvim/config-plugins/rnvimr.vim
source ~/.config/nvim/config-plugins/nvim-lspconfig.vim
source ~/.config/nvim/config-plugins/completion-nvim.vim
source ~/.config/nvim/config-plugins/nvim-treesitter.vim
source ~/.config/nvim/config-plugins/completion-treesitter.vim
source ~/.config/nvim/config-plugins/vim-gitgutter.vim

nnoremap <plug>(test-hi) :<c-u>call test#hello#hi()<cr>
nmap <silent> <F9> <plug>(test-hi) 
