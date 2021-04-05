vim.cmd('packadd vim-vsnip')
vim.cmd('packadd vim-vsnip-integ')

local map = function(mod, lhs, rhs, expr)
  vim.api.nvim_set_keymap(mod, lhs, rhs, {noremap = true, silent = true, expr = expr})
end
-- NOTE: You can use other key to expand snippet.
-- Expand
map('i', '<C-j>', [[vsnip#expandable()  ? "\<Plug>(vsnip-expand)" : "\<C-j>"]], true)
map('s', '<C-j>', [[vsnip#expandable()  ? "\<Plug>(vsnip-expand)" : "\<C-j>"]], true)

-- Expand or jump
map('i', '<C-l>', [[vsnip#available(1)  ? "\<Plug>(vsnip-expand-or-jump)" : "\<C-l>"]], true)
map('s', '<C-l>', [[vsnip#available(1)  ? "\<Plug>(vsnip-expand-or-jump)" : "\<C-l>"]], true)

-- Jump forward or backward
map('i', '<Tab>', [[vsnip#jumpable(1)  ? "\<Plug>(vsnip-jump-next)"  : "\<Tab>"]], true)
map('s', '<Tab>', [[vsnip#jumpable(1)   ? "\<Plug>(vsnip-jump-next)"  : "\<Tab>"]], true)
map('i', '<S-Tab>', [[vsnip#jumpable(-1)  ? "\<Plug>(vsnip-jump-prev)"  : "\<S-Tab>"]], true)
map('s', '<S-Tab>', [[vsnip#jumpable(-1)  ? "\<Plug>(vsnip-jump-prev)"  : "\<STab>"]], true)

-- Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
-- See https://github.com/hrsh7th/vim-vsnip/pull/50
map('n', 's',  [[<Plug>(vsnip-select-text)]])
map('x', 's',  [[<Plug>(vsnip-select-text)]])
map('n', 'S',  [[<Plug>(vsnip-cut-text)]])
map('x', 'S',  [[<Plug>(vsnip-cut-text)]])

-- If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
vim.g.vsnip_filetypes = {}
vim.g.vsnip_filetypes.javascriptreact = {'javascript'}
vim.g.vsnip_filetypes.typescriptreact = {'typescript'}
