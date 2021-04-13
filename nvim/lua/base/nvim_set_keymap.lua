-- normal mode register = "[register name]
-- insert mode register = <c-r>[register name]
-- command mode register = <c-r>[register name]
-- -- :[range] yank [register name]
-- -- :[range] y [register name]
--
--local function map(mod, lhs, rhs, expr)
--  vim.api.nvim_set_keymap(mod, lhs, rhs, {noremap=true, silent=true, expr=expr})
  --end

  -- Use <Tab> and <S-Tab> to navigate through popup menu
vim.g.mapleader = ','
   U.map('n', [[<leader>q]], [[:q<cr>]])
   --U.map('n', [[<leader>sb]], [[:Lspsaga close_floaterm<cr>]])
   U.map('i', [[<leader>q]], [[<ESC>:q<cr>]])
   U.map('t', [[<leader>q]], [[<c-\><c-n>:q<cr>]])
   --U.map('t', [[<leader>sb]], [[<c-\><c-n>:Lspsaga close_floaterm<cr>]])
   U.map('c', [[<leader>q]], [[<c-u>q<cr>]])
   U.map('v', [[<leader>q]], [[<ESC>:q<cr>]])
   U.map('s', [[<leader>q]], [[<ESC>:q<cr>]])
   U.map('x', [[<leader>q]], [[<ESC>:q<cr>]])

   U.map('n', [[<leader>00]], [[:q!<cr>]])
   U.map('i', [[<leader>00]], [[<ESC>:q!<cr>]])
   U.map('t', [[<leader>00]], [[<c-\><c-n>:q!<cr>]])
   U.map('c', [[<leader>00]], [[<c-u>q!<cr>]])
   U.map('v', [[<leader>00]], [[<ESC>:q!<cr>]])

   U.map('i', [[<c-j>]], [[pumvisible() ? "\<C-n>" : "\<Tab>"]], true)
   -- U.map('i', [[<c-k>]], [[pumvisible() ? "\<C-p>" : "\<Tab>"]], true)

   U.map('n', [[<leader>,]], [[<ESC>]])
   U.map('i', [[<leader>,]], [[<ESC>]])
   U.map('c', [[<leader>,]], [[<c-u><cr>]])
   U.map('v', [[<leader>,]], [[<esc>:<cr>]])
   U.map('t', [[<leader>,]], [[<c-\><c-n>]])

   U.map('n', [[<leader>w]], [[:up<cr>]])
   U.map('i', [[<leader>w]], [[<ESC>:up<cr>]])

   U.map('n', [[<leader>x]], [[:x<cr>]])
   U.map('i', [[<leader>x]], [[<ESC>:x<cr>]])

   U.map('n', [[<leader>y]], [["+yiw]])
   U.map('n', [[<leader>yy]], [["+yy]])
   U.map('i', [[<leader>y]], [[<ESC>"+yiw]])
   U.map('i', [[<leader>yy]], [[<ESC>"+yy]])
   U.map('t', [[<leader>y]], [["+yiw]])
   U.map('t', [[<leader>yy]], [["+yy]])
   U.map('v', [[<leader>y]], [["+y]])
   U.map('s', [[<leader>y]], [["+y]])

   U.map('n', [[<leader>p]], [["+p]])
   U.map('i', [[<leader>p]], [[<c-o>"+p]])
   U.map('c', [[<leader>p]], [[<c-r>+]])
   U.map('t', [[<leader>p]], [[<c-e><c-u><c-r>+<cr>]])

   U.map('n', [[<leader>h]], [[:up|winc h<cr>]])
   U.map('i', [[<leader>h]], [[<ESC>:up|winc h<cr>]])
   U.map('t', [[<leader>h]], [[<c-\><c-n>>:winc h<cr>]])
   U.map('n', [[<leader>H]], [[:up|winc H<cr>]])
   U.map('i', [[<leader>H]], [[<ESC>:up|winc H<cr>]])
   U.map('t', [[<leader>H]], [[<c-\><c-n>:winc H<cr>]])

   U.map('n', [[<leader>j]], [[:up|winc j<cr>]])
   U.map('i', [[<leader>j]], [[<ESC>:up|winc j<cr>]])
   U.map('t', [[<leader>j]], [[<c-\><c-n>:winc j<cr>]])
   U.map('n', [[<leader>J]], [[:up|winc J<cr>]])
   U.map('i', [[<leader>J]], [[<ESC>:up|winc J<cr>]])
   U.map('t', [[<leader>J]], [[<c-\><c-n>:winc J<cr>]])

   U.map('n', [[<leader>k]], [[:up|winc k<cr>]])
   U.map('i', [[<leader>k]], [[<ESC>:up|winc k<cr>]])
   U.map('t', [[<leader>k]], [[<c-\><c-n>:winc k<cr>]])
   U.map('n', [[<leader>K]], [[:up|winc K<cr>]])
   U.map('i', [[<leader>K]], [[<ESC>:up|winc K<cr>]])
   U.map('t', [[<leader>K]], [[<c-\><c-n>:winc K<cr>]])

   U.map('n', [[<leader>l]], [[:up|winc l<cr>]])
   U.map('i', [[<leader>l]], [[<ESC>:up|winc l<cr>]])
   U.map('t', [[<leader>l]], [[<c-\><c-n>:winc l<cr>]])
   U.map('n', [[<leader>L]], [[:up|winc L<cr>]])
   U.map('i', [[<leader>L]], [[<ESC>:up|winc L<cr>]])
   U.map('t', [[<leader>L]], [[<c-\><c-n>:winc L<cr>]])

   U.map('n', [[<leader>wf]], [[:winc _|winc |<CR>]])
   U.map('i', [[<leader>wf]], [[<ESC><c-u>:winc _|winc |<CR>]])
   U.map('t', [[<leader>wf]], [[<c-\><c-n>:winc _|winc |<CR>]])
   U.map('n', [[<leader>we]], [[:winc =<cr>]])
   U.map('i', [[<leader>we]], [[<ESC><c-u>:winc =<cr>]])
   U.map('t', [[<leader>we]], [[<c-\><c-n>:winc =<cr>]])

   U.map('n', [[<leader>wl]], [[:Lexplore|vertical resize 20<cr>]])
   U.map('i', [[<leader>wl]], [[<ESC><c-u>:Lexplore|vertical resize 20<cr>]])
   U.map('t', [[<leader>wl]], [[<c-\><c-n>:Lexplore|vertical resize 20<cr>]])

   U.map('n', [[<leader>wn]], [[:up|botright new]])
   U.map('i', [[<leader>wn]], [[<ESC>:up|botright new]])
   U.map('t', [[<leader>wn]], [[<c-\><c-n>:botright new]])
   U.map('n', [[<leader>wv]], [[:up|botright vnew]])
   U.map('i', [[<leader>wv]], [[<ESC>:up|botright vnew]])
   U.map('t', [[<leader>wv]], [[<c-\><c-n>:botright vnew]])

   U.map('n', [[<leader>wt]], [[:up|tabnew<c-l>]])
   U.map('i', [[<leader>wt]], [[<ESC>:up|tabnew<c-l>]])
   U.map('t', [[<leader>wt]], [[<c-\><c-n>:tabnew<c-l>]])
   --U.map('n', [[<leader>v]], [[<c-v>]])
   --U.map('i', [[<leader>v]], [[<esc><c-v>]])
   --U.map('t', [[<leader>v]], [[<c-\><c-n><c-v>]])
   -- use dic word macro
   -- ~/Project/dots/nvim/lua/lsp/lsp-saga.lua

   U.map('n', [[<leader>wd]], [["+yiw<cr>:botright new term://bash<CR>idic <c-\><c-n>"+pi<c-e><cr>]])
   U.map('i', [[<leader>wd]], [[<ESC>"+yiw<cr>:botright new term://bash<CR>idic <c-\><c-n>"+pi<cr>]])
   U.map('t', [[<leader>wd]], [[<c-u>dic <c-\><c-n>"+pi<c-e><cr>]])

   U.map('n', [[<leader>b]], [[:up|botright new term://bash<cr>]])
   U.map('i', [[<leader>b]], [[<ESC>:up|botright new term://bash<cr>]])
   U.map('c', [[<leader>b]], [[<c-u>:up|botright new term://bash<cr>]])
   U.map('t', [[<leader>b]], [[<c-e><c-u>make -j4<cr>]])

   U.map('n', [[<leader>cm]], [[:up|make -C build -j4|copen<cr>]])
   U.map('i', [[<leader>cm]], [[<ESC>:up|make -C build |copen<cr>]])
   U.map('c', [[<leader>cm]], [[<c-u>:up|make -C build |copen<cr>]])
   U.map('t', [[<leader>cm]], [[<c-e><c-u>make <cr>]])
   U.map('n', [[<leader>cn]], [[:up|set makeprg=ninja | make -C build | copen<cr>]])
   U.map('i', [[<leader>cn]], [[<ESC>:up|set makeprg=ninja | make -C build |copen<cr>]])
   U.map('c', [[<leader>cn]], [[<c-u>:up|set makeprg=ninja | make -C build |copen<cr>]])
   U.map('t', [[<leader>cn]], [[<c-e><c-u>ninja<cr>]])
   vim.cmd('packadd termdebug')
   U.map('n', [[<leader>cd]], [[:let @a=line('.') | let @b="<c-r>+"<cr>:<c-u>Termdebug build/jve<cr>:sleep 100m<cr>ibreak <c-\><c-n>"ap<cr>i<c-e><cr><c-\><c-n>irun<cr><c-\><c-n>:sleep 200m<cr>ip <c-\><c-n>:put "b<cr>i<cr>]])

   U.map('n', [[<leader>11]], [[:tabnew $nh/init.lua<cr>]])
   U.map('i', [[<leader>11]], [[<esc>:tabnew $nh/init.lua<cr>]])
   U.map('t', [[<leader>11]], [[<c-\><c-n>:botright new $nh/init.lua<cr>]])

   U.map('n', [[<leader>12]], [[:tabnew $nh/lua/base/vim_cmd_set.lua<cr>]])
   U.map('i', [[<leader>12]], [[<esc>:tabnew $nh/lua/base/vim_cmd_set.lua<cr>]])
   U.map('t', [[<leader>12]], [[<c-\><c-n>:botright new $nh/lua/base/vim_cmd_set.lua<cr>]])

   U.map('n', [[<leader>13]], [[:tabnew $nh/lua//base/nvim_set_keymap.lua<cr>]])
   U.map('i', [[<leader>13]], [[<esc>:tabnew $nh/lua/base/nvim_set_keymap.lua<cr>]])
   U.map('t', [[<leader>13]], [[<c-\><c-n>:botright new $nh/lua/base/vim_cmd_set.lua<cr>]])

   U.map('n', [[<leader>14]], [[:tabnew $nh/lua/lsp/lsp-config.lua<cr>]])
   U.map('i', [[<leader>14]], [[<esc>:tabnew $nh/lua/lsp/lsp-config.lua<cr>]])
   U.map('t', [[<leader>14]], [[<c-\><c-n>:botright new $nh/lua/lsp/lsp-config.lua<cr><cr>]])

   U.map('n', [[<leader>15]], [[:tabnew $nh/lua/lsp/lsp-saga.lua<cr>]])
   U.map('i', [[<leader>15]], [[<esc>:tabnew $nh/lua/lsp/lsp-saga.lua<cr>]])
   U.map('t', [[<leader>15]], [[<c-\><c-n>:botright new $nh/lua/lsp/lsp-saga.lua<cr><cr>]])

   U.map('n', [[<leader>2]], [[:tabnew ~/.bashrc<cr>]])
   U.map('i', [[<leader>2]], [[<esc>:tabnew ~/.bashrc<cr>]])
   U.map('t', [[<leader>2]], [[<c-\><c-n>:botright new ~/.bashrc<cr>]])

   U.map('n', [[<leader>3]], [[:tabnew $th/terms.md<cr>]])
   U.map('i', [[<leader>3]], [[<esc>:tabnew $th/terms.md<cr>]])
   U.map('t', [[<leader>3]], [[<c-\><c-n>:tabnew $th/terms.md<cr>]])
