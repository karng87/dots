vim.g.mapleader = ','
--vim.api.nvim_set_keymap('n', '<leader>,', ':', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>,', '<ESC>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('c', '<leader>,', '<c-u><cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('v', '<leader>,', '<esc>:<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<leader>,', '<c-\\><c-n>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('i', '<leader>f', '<c-w><c-f>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>v', '<c-w><c-v>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>o', '<c-w><c-o>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>]', '<c-w><c-]>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<leader>w', ':w<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>w', '<ESC>:w<cr>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<leader>x', ':x<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>x', '<ESC>:x<cr>', {noremap=true, silent=true})


vim.api.nvim_set_keymap('n', '<leader>q', ':q<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>q', '<ESC>:q<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<leader>q', '<c-\\><c-n>:q<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('c', '<leader>q', '<c-u>q<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('v', '<leader>q', '<ESC>:q<cr>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<leader>0', ':q!<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>0', '<ESC>:q!<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<leader>0', '<c-\\><c-n>:q!<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('c', '<leader>0', '<c-u>q!<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('v', '<leader>0', '<ESC>:q!<cr>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<leader>h', ':w<cr>:winc h<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>h', '<ESC>:w<cr>:winc h<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<leader>h', '<c-\\><c-n>>:winc h<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>H', ':w<cr>:winc H<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>H', '<ESC>:w<cr>:winc H<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<leader>H', '<c-\\><c-n>:winc H<cr>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<leader>j', ':w<cr>:winc j<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>j', '<ESC>:w<cr>:winc j<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<leader>j', '<c-\\><c-n>:winc j<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>J', ':w<cr>:winc J<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>J', '<ESC>:w<cr>:winc J<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<leader>J', '<c-\\><c-n>:winc J<cr>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<leader>k', ':w<cr>:winc k<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>k', '<ESC>:w<cr>:winc k<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<leader>k', '<c-\\><c-n>:winc k<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>K', ':w<cr>:winc K<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>K', '<ESC>:w<cr>:winc K<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<leader>K', '<c-\\><c-n>:winc K<cr>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<leader>l', ':w<cr>:winc l<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>l', '<ESC>:w<cr>:winc l<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<leader>l', '<c-\\><c-n>:winc l<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>L', ':w<cr>:winc L<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>L', '<ESC>:w<cr>:winc L<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<leader>L', '<c-\\><c-n>:winc L<cr>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<leader>h', ':w<cr>:winc h<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>h', '<ESC>:w<cr>:winc h<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<leader>h', '<c-\\><c-n>:winc h<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>H', ':w<cr>:winc H<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>H', '<ESC>:w<cr>:winc H<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<leader>H', '<c-\\><c-n>:winc H<cr>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<leader>a', ':winc _<cr>:winc |<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>a', '<ESC><c-u>:winc _<cr>:winc |<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<leader>a', '<c-\\><c-n>:winc _<cr>:winc |<cr>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<leader>n', ':botright new<space>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>n', '<ESC>:botright new<space>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<leader>n', '<c-\\><c-n>:botright<space>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<leader>v', '<c-v>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>v', '<esc><c-v>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<leader>v', '<c-\\><c-n><c-v>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<leader>y', '"jy', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>y', '<ESC>byw', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<leader>y', '"jy', {noremap=true, silent=true})
vim.api.nvim_set_keymap('v', '<leader>y', '"jy', {noremap=true, silent=true})
vim.api.nvim_set_keymap('s', '<leader>y', '"jy', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<leader>d', 'byw:botright new term://bash<cr>:winc _<cr>idic <c-\\><c-n>pi<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>d', '<ESC>byw:botright new term://bash<cr>:winc _<cr>idic <c-\\><c-n>pi<cr>', {noremap=true, silent=true})


vim.api.nvim_set_keymap('n', '<leader>p', '"jp', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>p', '<c-o>"jp', {noremap=true, silent=true})
vim.api.nvim_set_keymap('c', '<leader>p', '<c-r>jp', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<leader>p', '<c-e><c-u>dic <c-r>"<cr>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<leader>b', ':botright new term://bash<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>b', '<ESC>:w<cr>:botright new term://bash<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('c', '<leader>b', '<c-u>:botright new term:://bash<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<leader>b', '<c-e><c-u>make -j4<cr>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<leader>1', ':botright new $nh/init.lua<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>1', '<esc>:botright new $nh/init.lua<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<leader>1', '<c-\\><c-n>:botright new $nh/init.lua<cr>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<leader>2', ':botright new ~/.bashrc<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>2', '<esc>:botright new ~/.bashrc<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<leader>2', '<c-\\><c-n>:botright new ~/.bashrc<cr>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<leader>c', ':winc<space>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>c', '<esc>:winc<space>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<leader>c', '<c-\\><c-n>:winc<space>', {noremap=true, silent=true})

-- Use <Tab> and <S-Tab> to navigate through popup menu
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})

-- Set completeopt to have a better completion experience
vim.o.completeopt="menuone,noinsert,noselect"

-- Avoid showing message extra message when using completion
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.cmdheight = 2
vim.wo.number = true
vim.wo.rnu = true
vim.wo.signcolumn = 'yes'
vim.bo.tabstop = 3
vim.bo.softtabstop = 3
vim.bo.shiftwidth = 3
vim.bo.smartindent = true

vim.cmd('packadd! gruvbox')
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

vim.cmd('packadd! vim-airline')
vim.cmd('packadd! popup')
vim.cmd('packadd! plenary')

vim.cmd('packadd! nvim-web-devicons')
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
require'lsp.lsp-config'

vim.cmd('packadd! telescope')
