packadd! completion-treesitter

"===========================
"" completion treesitter ""
"===========================
    " Configure the completion chains
    " let g:completion_chain_complete_list = {
    "             \'default' : {
    "             \	'default' : [
    "             \		{'complete_items' : ['lsp', 'snippet']},
    "             \		{'mode' : 'file'}
    "             \	],
    "             \	'comment' : [],
    "             \	'string' : []
    "             \	},
    "             \'vim' : [
    "             \	{'complete_items': ['snippet']},
    "             \	{'mode' : 'cmd'}
    "             \	],
    "             \}

    " " Use completion-nvim in every buffer
    " autocmd BufEnter * lua require'completion'.on_attach()
