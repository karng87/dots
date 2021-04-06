-- ~/Project/dots/nvim/lua/base/utils.lua
U = require'base.utils'
-- ~/Project/dots/nvim/lua/base/vim_cmd_set.lua
require'base.vim_cmd_set'
-- ~/Project/dots/nvim/lua/base/nvim_set_keymap.lua
require'base.nvim_set_keymap'

vim.cmd('packadd! gruvbox')
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

vim.cmd('packadd vim-airline')
--vim.cmd('packadd popup')

vim.cmd('packadd nvim-web-devicons')
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

-- ~/Project/dots/nvim/lua/lsp/lsp-config.lua
require'lsp.lsp-config'

-- ~/Project/dots/nvim/lua/lsp/lsp-completion-nvim.lua
require'lsp.lsp-completion-nvim'

-- ~/Project/dots/nvim/lua/lsp/lsp-treesitter.lua
require'lsp.lsp-treesitter'

--require'lsp.lsp-vsnip'
--require'lsp.lsp-config'
--require'lsp.lsp-treesitter'
--require'lsp.lsp-utils'
--require'lsp.lsp-compe'
