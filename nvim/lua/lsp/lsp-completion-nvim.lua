vim.cmd('packadd completion-nvim')

U.let_g('completion_enable_snippet', 'vim-vsnip')
U.let_g('completion_matching_strategy_list', {'exact', 'substring', 'fuzzy', 'all'})
vim.cmd([[autocmd BufEnter * lua require'completion'.on_attach()]])

---- define an chain complete list
--local chain_complete_list = {
--  default = {
--    {complete_items = {'lsp', 'snippet'}},
--    {complete_items = {'path'}, triggered_only = {'/'}},
--    {complete_items = {'buffers'}},
--  },
--  string = {
--    {complete_items = {'path'}, triggered_only = {'/'}},
--  },
--  comment = {},
--}
--
--local on_attach = function()
--  -- passing in a table with on_attach function
--  require'completion'.on_attach({
--      sorting = 'alphabet',
--      matching_strategy_list = {'exact', 'fuzzy'},
--      chain_complete_list = chain_complete_list,
--    })
--end
