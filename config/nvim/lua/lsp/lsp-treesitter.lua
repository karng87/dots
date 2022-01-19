vim.cmd("packadd! nvim-treesitter")
require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    highlight = { enable = true },
    indent = {enable = true, disable = {"python", "html", "javascript"}},
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false -- Whether the query persists across vim sessions
    },
    autotag = {enable = true},
    rainbow = {enable = false},
    context_commentstring = {enable = true, config = {javascriptreact = {style_element = '{/*%s*/}'}}}
    -- refactor = {highlight_definitions = {enable = true}}
    }
