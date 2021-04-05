local function nmap(mod, lhs, rhs, expr)
  vim.api.nvim_set_keymap(mod, lhs, rhs, {noremap=true, silent=true, expr=expr})
end

nmap('n', '<leader>,', '<ESC>')
nmap('i', '<leader>,', '<ESC>')
nmap('c', '<leader>,', '<c-u><cr>')
nmap('v', '<leader>,', '<esc>:<cr>')
nmap('t', '<leader>,', [[<c-\><c-n>]])

nmap('i', '<leader>f', '<c-w><c-f>')
nmap('i', '<leader>v', '<c-w><c-v>')
nmap('i', '<leader>o', '<c-w><c-o>')
nmap('i', '<leader>]', '<c-w><c-]>')

nmap('n', '<leader>w', ':w<cr>')
nmap('i', '<leader>w', '<ESC>:w<cr>')

nmap('n', '<leader>x', ':x<cr>')
nmap('i', '<leader>x', '<ESC>:x<cr>')


nmap('n', '<leader>q', ':q<cr>')
nmap('i', '<leader>q', '<ESC>:q<cr>')
nmap('t', '<leader>q', [[<c-\><c-n>:q<cr>]])
nmap('c', '<leader>q', '<c-u>q<cr>')
nmap('v', '<leader>q', '<ESC>:q<cr>')
nmap('n', '<leader>0', ':q!<cr>')
nmap('i', '<leader>0', '<ESC>:q!<cr>')
nmap('t', '<leader>0', [[<c-\><c-n>:q!<cr>]])
nmap('c', '<leader>0', '<c-u>q!<cr>')
nmap('v', '<leader>0', '<ESC>:q!<cr>')

nmap('n', '<leader>h', ':w<cr>:winc h<cr>')
nmap('i', '<leader>h', '<ESC>:w<cr>:winc h<cr>')
nmap('t', '<leader>h', [[<c-\><c-n>>:winc h<cr>]])
nmap('n', '<leader>H', ':w<cr>:winc H<cr>')
nmap('i', '<leader>H', '<ESC>:w<cr>:winc H<cr>')
nmap('t', '<leader>H', [[<c-\><c-n>:winc H<cr>]])

nmap('n', '<leader>j', ':w<cr>:winc j<cr>')
nmap('i', '<leader>j', '<ESC>:w<cr>:winc j<cr>')
nmap('t', '<leader>j', [[<c-\><c-n>:winc j<cr>]])
nmap('n', '<leader>J', ':w<cr>:winc J<cr>')
nmap('i', '<leader>J', '<ESC>:w<cr>:winc J<cr>')
nmap('t', '<leader>J', [[<c-\><c-n>:winc J<cr>]])

nmap('n', '<leader>k', ':w<cr>:winc k<cr>')
nmap('i', '<leader>k', '<ESC>:w<cr>:winc k<cr>')
nmap('t', '<leader>k', [[<c-\><c-n>:winc k<cr>]])
nmap('n', '<leader>K', ':w<cr>:winc K<cr>')
nmap('i', '<leader>K', '<ESC>:w<cr>:winc K<cr>')
nmap('t', '<leader>K', [[<c-\><c-n>:winc K<cr>]])

nmap('n', '<leader>l', ':w<cr>:winc l<cr>')
nmap('i', '<leader>l', '<ESC>:w<cr>:winc l<cr>')
nmap('t', '<leader>l', [[<c-\><c-n>:winc l<cr>]])
nmap('n', '<leader>L', ':w<cr>:winc L<cr>')
nmap('i', '<leader>L', '<ESC>:w<cr>:winc L<cr>')
nmap('t', '<leader>L', [[<c-\><c-n>:winc L<cr>]])

nmap('n', '<leader>h', ':w<cr>:winc h<cr>')
nmap('i', '<leader>h', '<ESC>:w<cr>:winc h<cr>')
nmap('t', '<leader>h', [[<c-\><c-n>:winc h<cr>]])
nmap('n', '<leader>H', ':w<cr>:winc H<cr>')
nmap('i', '<leader>H', '<ESC>:w<cr>:winc H<cr>')
nmap('t', '<leader>H', [[<c-\><c-n>:winc H<cr>]])

nmap('n', '<leader>a', ':winc _<cr>:winc |<CR>')
nmap('i', '<leader>a', '<ESC><c-u>:winc _<cr>:winc |<CR>')
nmap('t', '<leader>a', [[<c-\><c-n>:winc _<cr>:winc |<CR>]])

nmap('n', '<leader>n', ':botright new')
nmap('i', '<leader>n', '<ESC>:botright new')
nmap('t', '<leader>n', [[<c-\><c-n>:botright new]])
nmap('n', '<leader>v', ':botright vnew')
nmap('i', '<leader>v', '<ESC>:botright vnew')
nmap('t', '<leader>v', [[<c-\><c-n>:botright vnew]])

nmap('n', '<leader>cv', '<c-v>')
nmap('i', '<leader>cv', '<esc><c-v>')
nmap('t', '<leader>cv', [[<c-\><c-n><c-v>]])

nmap('n', '<leader>y', '"+y')
nmap('i', '<leader>y', '<ESC>b"+yw')
nmap('t', '<leader>y', '"+y')
nmap('v', '<leader>y', '"+y')
nmap('s', '<leader>y', '"+y')

nmap('n', '<leader>p', '"+p')
nmap('i', '<leader>p', '<c-o>"+p')
nmap('c', '<leader>p', '<c-r>+p')
nmap('t', '<leader>p', '<c-e><c-u>dic <c-r>+<cr>')

nmap('n', '<leader>dic', [[b"+yw:botright new term://bash<cr>:winc _<cr>idic <c-\><c-n>"+pi<c-e><cr>]])
nmap('i', '<leader>dic', [[<ESC>b"+yw:botright new term://bash<cr>:winc _<cr>idic <c-\><c-n>pi<cr>]])



nmap('n', '<leader>b', ':botright new term://bash<cr>')
nmap('i', '<leader>b', '<ESC>:w<cr>:botright new term://bash<cr>')
nmap('c', '<leader>b', '<c-u>:botright new term:://bash<cr>')
nmap('t', '<leader>b', '<c-e><c-u>make -j4<cr>')

nmap('n', '<leader>1', ':botright new $nh/init.lua<cr>')
nmap('i', '<leader>1', '<esc>:botright new $nh/init.lua<cr>')
nmap('t', '<leader>1', [[<c-\><c-n>:botright new $nh/init.lua<cr>]])

nmap('n', '<leader>2', ':botright new ~/.bashrc<cr>')
nmap('i', '<leader>2', '<esc>:botright new ~/.bashrc<cr>')
nmap('t', '<leader>2', [[<c-\><c-n>:botright new ~/.bashrc<cr>]])

nmap('n', '<leader>cw', ':winc<space>')
nmap('i', '<leader>cw', '<esc>:winc<space>')
nmap('t', '<leader>cw', [[<c-\><c-n>:winc<space>]])

-- Use <Tab> and <S-Tab> to navigate through popup menu
nmap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], true)
nmap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<Tab>"]], true)
--
nmap('i', '<leader>nh', '<ESC>:set hlsearch!<CR>')
nmap('n', '<leader>nh', '<ESC>:set hlsearch!<CR>')
nmap('t', '<leader>nh', [[<c-\><c-n>:set hlsearch!<CR>]])

nmap('n', '<leader>un', ':UndotreeToggle<cr>')
nmap('n', '<leader>:', ':<up>')
--vmap('<leader>p', '"_dP')
nmap('n', '<leader>sC', [[:CheatWithoutComments<CR>]])
nmap('n', '<leader>sc', [[:Cheat<CR>]])
nmap('n', '<leader>ll', [[:<C-p>]])

nmap('i', '<C-Space>', [[compe#complete()]], true)
nmap('i', '<CR>', [[compe#confirm('<CR>')]], true)
nmap('i', '<C-e>',[[compe#close('<C-e>')]], true)
nmap('i', '<C-c>', [[:cclose<CR>]])
nmap('i', '<C-l>', [[:lclose<CR>]])
nmap('i', '<C-n>', [[:cnext<CR>]])
nmap('i', '<C-p>', [[:cprev<CR>]])
nmap('i', '<leader>n', [[:lnext<CR>]])
nmap('i', '<leader>p', [[:lprev<CR>]])
--
return nmap
