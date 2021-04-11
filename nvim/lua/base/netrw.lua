vim.api.nvim_set_var('netrw_liststyle', '3')
vim.api.nvim_set_var('netrw_winsize', '20')
vim.api.nvim_set_var('netrw_preview', '1')

vim.cmd(string.format('set %s', 'nocompatible'))
vim.cmd(string.format('set %s', 'path+=**'))
vim.cmd(string.format('set %s', 'wildmenu'))

vim.api.nvim_set_keymap('n', '<leader>nl', [[:Lexplore<cr>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<leader>nl', [[<esc>:Lexplore<cr>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<leader>nl', [[<c-\><c-n>:Lexplore<cr>]], {noremap=true, silent=true})
