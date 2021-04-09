-- ~/Project/dots/nvim/lua/base/utils.lua
U = require'base.utils'

-- ~/Project/dots/nvim/lua/base/vim_cmd_set.lua
require'base.vim_cmd_set'

-- ~/Project/dots/nvim/lua/base/nvim_set_keymap.lua
require'base.nvim_set_keymap'

-- ~/Project/dots/nvim/lua/base/gruvbox.lua
require'base.gruvbox'

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

-- ~/Project/dots/nvim/lua/base/galaxyline.lua
require 'base.galaxyline'
--vim.cmd('packadd popup')


-- ~/Project/dots/nvim/lua/lsp/lsp-config.lua
require'lsp.lsp-config'

-- ~/Project/dots/nvim/lua/lsp/lsp-completion-nvim.lua
require'lsp.lsp-completion-nvim'

-- ~/Project/dots/nvim/lua/lsp/lsp-vsnip.lua
require'lsp.lsp-vsnip'

-- ~/Project/dots/nvim/lua/lsp/lsp-treesitter.lua
require'lsp.lsp-treesitter'

-- ~/Project/dots/nvim/lua/lsp/lsp-saga.lua
require'lsp.lsp-saga'
--require'lsp.lsp-vsnip'
--require'lsp.lsp-config'
--require'lsp.lsp-treesitter'
--require'lsp.lsp-utils'
--require'lsp.lsp-compe'
