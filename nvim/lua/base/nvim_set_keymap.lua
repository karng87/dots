--local function map(mod, lhs, rhs, expr)
--  vim.api.nvim_set_keymap(mod, lhs, rhs, {noremap=true, silent=true, expr=expr})
  --end

  -- Use <Tab> and <S-Tab> to navigate through popup menu
  U.map('i', '<c-j>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], true)
  U.map('i', '<c-k>', [[pumvisible() ? "\<C-p>" : "\<Tab>"]], true)

  U.map('n', '<leader>,', '<ESC>')
  U.map('i', '<leader>,', '<ESC>')
  U.map('c', '<leader>,', '<c-u><cr>')
  U.map('v', '<leader>,', '<esc>:<cr>')
  U.map('t', '<leader>,', [[<c-\><c-n>]])

  U.map('i', '<leader>f', '<c-w><c-f>')
  U.map('i', '<leader>v', '<c-w><c-v>')
  U.map('i', '<leader>o', '<c-w><c-o>')
  U.map('i', '<leader>]', '<c-w><c-]>')

  U.map('n', '<leader>w', ':w<cr>')
  U.map('i', '<leader>w', '<ESC>:w<cr>')

  U.map('n', '<leader>x', ':x<cr>')
  U.map('i', '<leader>x', '<ESC>:x<cr>')


  U.map('n', '<leader>q', ':q<cr>')
  U.map('i', '<leader>q', '<ESC>:q<cr>')
  U.map('t', '<leader>q', [[<c-\><c-n>:q<cr>]])
  U.map('c', '<leader>q', '<c-u>q<cr>')
  U.map('v', '<leader>q', '<ESC>:q<cr>')
  U.map('n', '<leader>0', ':q!<cr>')
  U.map('i', '<leader>0', '<ESC>:q!<cr>')
  U.map('t', '<leader>0', [[<c-\><c-n>:q!<cr>]])
  U.map('c', '<leader>0', '<c-u>q!<cr>')
  U.map('v', '<leader>0', '<ESC>:q!<cr>')

  U.map('n', '<leader>h', ':wall<cr>:winc h<cr>')
  U.map('i', '<leader>h', '<ESC>:w<cr>:winc h<cr>')
  U.map('t', '<leader>h', [[<c-\><c-n>>:winc h<cr>]])
  U.map('n', '<leader>H', ':wall<cr>:winc H<cr>')
  U.map('i', '<leader>H', '<ESC>:w<cr>:winc H<cr>')
  U.map('t', '<leader>H', [[<c-\><c-n>:winc H<cr>]])

  U.map('n', '<leader>j', ':wall<cr>:winc j<cr>')
  U.map('i', '<leader>j', '<ESC>:w<cr>:winc j<cr>')
  U.map('t', '<leader>j', [[<c-\><c-n>:winc j<cr>]])
  U.map('n', '<leader>J', ':w<cr>:winc J<cr>')
  U.map('i', '<leader>J', '<ESC>:w<cr>:winc J<cr>')
  U.map('t', '<leader>J', [[<c-\><c-n>:winc J<cr>]])

  U.map('n', '<leader>k', ':wall<cr>:winc k<cr>')
  U.map('i', '<leader>k', '<ESC>:w<cr>:winc k<cr>')
  U.map('t', '<leader>k', [[<c-\><c-n>:winc k<cr>]])
  U.map('n', '<leader>K', ':w<cr>:winc K<cr>')
  U.map('i', '<leader>K', '<ESC>:w<cr>:winc K<cr>')
  U.map('t', '<leader>K', [[<c-\><c-n>:winc K<cr>]])

  U.map('n', '<leader>l', ':wall<cr>:winc l<cr>')
  U.map('i', '<leader>l', '<ESC>:w<cr>:winc l<cr>')
  U.map('t', '<leader>l', [[<c-\><c-n>:winc l<cr>]])
  U.map('n', '<leader>L', ':w<cr>:winc L<cr>')
  U.map('i', '<leader>L', '<ESC>:w<cr>:winc L<cr>')
  U.map('t', '<leader>L', [[<c-\><c-n>:winc L<cr>]])

  U.map('n', '<leader>h', ':wall<cr>:winc h<cr>')
  U.map('i', '<leader>h', '<ESC>:w<cr>:winc h<cr>')
  U.map('t', '<leader>h', [[<c-\><c-n>:winc h<cr>]])
  U.map('n', '<leader>H', ':w<cr>:winc H<cr>')
  U.map('i', '<leader>H', '<ESC>:w<cr>:winc H<cr>')
  U.map('t', '<leader>H', [[<c-\><c-n>:winc H<cr>]])

  U.map('n', '<leader>ss', ':winc _<cr>:winc |<CR>')
U.map('i', '<leader>ss', '<ESC><c-u>:winc _<cr>:winc |<CR>')
U.map('t', '<leader>ss', [[<c-\><c-n>:winc _<cr>:winc |<CR>]])
U.map('n', '<leader>se', ':winc =<cr>')
U.map('i', '<leader>se', '<ESC><c-u>:winc =<cr>')
U.map('t', '<leader>se', [[<c-\><c-n>:winc =<cr>]])

U.map('n', '<leader>n', ':wall<cr>:botright new')
U.map('i', '<leader>n', '<ESC>:wall<cr>:botright new')
U.map('t', '<leader>n', [[<c-\><c-n>:botright new]])
U.map('n', '<leader>v', ':wall<cr>:botright vnew')
U.map('i', '<leader>v', '<ESC>:wall<cr>:botright vnew')
U.map('t', '<leader>v', [[<c-\><c-n>:botright vnew]])

U.map('n', '<leader>cv', '<c-v>')
U.map('i', '<leader>cv', '<esc><c-v>')
U.map('t', '<leader>cv', [[<c-\><c-n><c-v>]])

U.map('n', '<leader>y', '"+yiw')
U.map('i', '<leader>y', '<ESC>b"+yiw')
U.map('t', '<leader>y', '"+yiw')
U.map('v', '<leader>y', '"+y')
U.map('s', '<leader>y', '"+y')

U.map('n', '<leader>p', '"+p')
U.map('c', '<leader>p', '"+p')
U.map('i', '<leader>p', '<c-o>"+p')
U.map('c', '<leader>p', '<c-r>+')
U.map('t', '<leader>p', '<c-e><c-u>dic <c-r>+<cr>')

U.map('n', '<leader>dic', [[b"+yw:botright new term://bash<cr>:winc _<cr>idic <c-\><c-n>"+pi<c-e><cr>]])
U.map('i', '<leader>dic', [[<ESC>b"+yw:botright new term://bash<cr>:winc _<cr>idic <c-\><c-n>pi<cr>]])

U.map('n', '<leader>b', ':botright new term://bash<cr>')
U.map('i', '<leader>b', '<ESC>:w<cr>:botright new term://bash<cr>')
U.map('c', '<leader>b', '<c-u>:botright new term:://bash<cr>')
U.map('t', '<leader>b', '<c-e><c-u>make -j4<cr>')

U.map('n', '<leader>1', ':botright new $nh/init.lua<cr>')
U.map('i', '<leader>1', '<esc>:botright new $nh/init.lua<cr>')
U.map('t', '<leader>1', [[<c-\><c-n>:botright new $nh/init.lua<cr>]])

U.map('n', '<leader>2', ':botright new ~/.bashrc<cr>')
U.map('i', '<leader>2', '<esc>:botright new ~/.bashrc<cr>')
U.map('t', '<leader>2', [[<c-\><c-n>:botright new ~/.bashrc<cr>]])

U.map('n', '<leader>oh', ':set hlsearch!<CR>')
U.map('t', '<leader>oh', [[<c-\><c-n>:set hlsearch!<CR>]])
