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
   U.map('i', [[jj]], [[<ESC>]])
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

   U.map('n', [[<leader>wd]], [["+yiw:botright new term://bash<cr> | idic <c-\><c-n>:put +<cr>i<cr>]])
   U.map('i', [[<leader>wd]], [[<ESC>"+yiw:botright new term://bash<cr> | idic <c-\><c-n>:put +<cr>i<cr>]])
   U.map('t', [[<leader>wd]], [[<c-u>dic <c-\><c-n>:put +<cr> | i<c-e><cr>]])

   U.map('n', [[<leader>bh]], [[:up | let @a=expand('%:p:h') | botright new term://bash<cr> | <esc>icd <c-\><c-n>:put a<cr>i<cr>]])
   U.map('n', [[<leader>bb]], [[:up | botright new term://bash<cr>]])

  -- build
  -- -- cmake -S .. -B build -G Ninja
  -- -- ccmake -S .. -B build -G Ninja
  -- -- cmake .. -B build -G Ninja
  -- -- ccmake .. -B build -G Ninja
  --
  -- -- cmake --build dir
  -- -- cmake --build build --target clean
  -- -- ninja -C dir
  -- -- ninja -C build clean
  -- -- make -C dir
  -- -- make -C build clean

  -- cmake build
   U.map('n', [[<leader>cb]], [[:up | set makeprg=cmake | make --build build | :copen<cr>]])
  -- cmake clean
   U.map('n', [[<leader>cc]], [[:up | set makeprg=cmake | make --build build --target clean | :copen<cr>]])

  -- make or ninja
   U.map('n', [[<leader>cn]], [[:up | set makeprg=cmake | make -B build -G Ninja| :copen<cr>]])
   U.map('n', [[<leader>cm]], [[:up | set makeprg=cmake | make -B build | :copen<cr>]])

   U.map('n', [[<leader>cx]], [[:up | botright new term://bash<cr>|i./build/jve_engine<cr>]])

   -- termbug Termbug exex
   vim.cmd('packadd termdebug')

   U.map('n', [[<leader>cg]], [[:let @a=expand("%").":".line('.') | let @b=expand('<cWORD>')<cr>:<c-u>Termdebug build/jve_engine<cr>:sleep 100m<cr>ibreak <c-\><c-n>:put a<cr>i<c-e><cr><c-\><c-n>irun<cr><c-\><c-n>:sleep 200m<cr>ip *<c-\><c-n>:put b<cr>i]])

   -- shortcut to lua files
 --  U.map('n', [[<leader>11]], [[:up|tabnew $nh/init.lua<cr>]])
 --  U.map('i', [[<leader>11]], [[<esc>:up|tabnew $nh/init.lua<cr>]])
 --  U.map('t', [[<leader>11]], [[<c-\><c-n>:up|botright new $nh/init.lua<cr>]])

 --  U.map('n', [[<leader>12]], [[:up|tabnew $nh/lua/base/vim_cmd_set.lua<cr>]])
 --  U.map('i', [[<leader>12]], [[<esc>:up|tabnew $nh/lua/base/vim_cmd_set.lua<cr>]])
 --  U.map('t', [[<leader>12]], [[<c-\><c-n>:up|botright new $nh/lua/base/vim_cmd_set.lua<cr>]])

 --  U.map('n', [[<leader>13]], [[:up|tabnew $nh/lua//base/nvim_set_keymap.lua<cr>]])
 --  U.map('i', [[<leader>13]], [[<esc>:tabnew $nh/lua/base/nvim_set_keymap.lua<cr>]])
 --  U.map('t', [[<leader>13]], [[<c-\><c-n>:botright new $nh/lua/base/vim_cmd_set.lua<cr>]])

 --  U.map('n', [[<leader>14]], [[:up|tabnew $nh/lua/lsp/lsp-config.lua<cr>]])
 --  U.map('i', [[<leader>14]], [[<esc>:up|tabnew $nh/lua/lsp/lsp-config.lua<cr>]])
 --  U.map('t', [[<leader>14]], [[<c-\><c-n>:botright new $nh/lua/lsp/lsp-config.lua<cr><cr>]])

 --  U.map('n', [[<leader>15]], [[:up|tabnew $nh/lua/lsp/lsp-saga.lua<cr>]])
 --  U.map('i', [[<leader>15]], [[<esc>:up|tabnew $nh/lua/lsp/lsp-saga.lua<cr>]])
 --  U.map('t', [[<leader>15]], [[<c-\><c-n>:up|botright new $nh/lua/lsp/lsp-saga.lua<cr><cr>]])

 --  U.map('n', [[<leader>2]], [[:up|tabnew ~/.bashrc<cr>]])
 --  U.map('i', [[<leader>2]], [[<esc>:up|tabnew ~/.bashrc<cr>]])
 --  U.map('t', [[<leader>2]], [[<c-\><c-n>:up|botright new ~/.bashrc<cr>]])

 --  U.map('n', [[<leader>3]], [[:up|tabnew $th/terms.md<cr>]])
 --  U.map('i', [[<leader>3]], [[<esc>:up|tabnew $th/terms.md<cr>]])
 --  U.map('t', [[<leader>3]], [[<c-\><c-n>:up|tabnew $th/terms.md<cr>]])
