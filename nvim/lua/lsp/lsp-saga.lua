vim.cmd('packadd lspsaga-nvim')
local saga = require 'lspsaga'

-- add your config value here
-- default value
-- use_saga_diagnostic_sign = true
-- error_sign = '',
-- warn_sign = '',
-- hint_sign = '',
-- infor_sign = '',
-- dianostic_header_icon = '   ',
-- code_action_icon = ' ',
-- code_action_prompt = {
--   enable = true,
--   sign = true,
--   sign_priority = 20,
--   virtual_text = true,
-- },
-- finder_definition_icon = '  ',
-- finder_reference_icon = '  ',
-- max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
-- finder_action_keys = {
--   open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
-- },
-- code_action_keys = {
--   quit = 'q',exec = '<CR>'
-- },
-- rename_action_keys = {
--   quit = '<C-c>',exec = '<CR>'  -- quit can be a table
-- },
-- definition_preview_icon = '  '
-- 1: thin border | 2: rounded border | 3: thick border | 4: ascii border
-- border_style = 1
-- rename_prompt_prefix = '➤',
-- if you don't use nvim-lspconfig you must pass your server name and
-- the related filetypes into this table
-- like server_filetype_map = {metals = {'sbt', 'scala'}}
-- server_filetype_map = {}

--saga.init_lsp_saga {
--  your custom option here
--}

--or --use default config
saga.init_lsp_saga()
vim.api.nvim_set_keymap('n', '<leader>f', ':Lspsaga lsp_finder<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>s', [[:Lspsaga signature_help<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>d', [[:Lspsaga preview_definition<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>o', ':Lspsaga hover_doc<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>c', ':Lspsaga code_action<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<leader>c', ':<C-U>Lspsaga range_code_action<CR>', {noremap = true, silent = true})
-- use dic word macro
vim.api.nvim_set_keymap('n', '<leader>sb', [[:Lspsaga open_floaterm<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<leader>sb', [[<C-\><C-n>:Lspsaga close_floaterm<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-f>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-b>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>sr', [[:Lspsaga rename<CR>]], {noremap = true, silent = true})

-- show diagnostic if line is over the area
vim.api.nvim_set_keymap('n', '<leader>sl', [[:Lspsaga show_line_diagnostics<CR>]], {noremap = true, silent = true})
-- only show diagnostic if cursor is over the area
vim.api.nvim_set_keymap('n', '<leader>sc', [[:Lspsaga show_cursor_diagnostics<CR>]], {noremap = true, silent = true})
-- jump diagnostic
vim.api.nvim_set_keymap('n', '<leader>sj', [[:Lspsaga diagnostic_jump_next<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sk', [[:Lspsaga diagnostic_jump_prev<CR>]], {noremap = true, silent = true})
