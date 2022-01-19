packadd! nvim-treesitter

"====================
"" nvim-treesitter ""
"====================

    " set foldmethod=expr
    " set foldexpr=nvim_treesitter#foldexpr()
    
    ""  Statusline indicator
    echo nvim_treesitter#statusline(90)  

""""""""""""""""""""
"" Adding modules ""
""""""""""""""""""""
lua <<EOF
    local ts_utils = require 'nvim-treesitter.ts_utils'
    require'nvim-treesitter'.define_modules {
      my_cool_plugin = {
        attach = function(bufnr, lang)
          -- Do cool stuff here
        end,
        detach = function(bufnr)
          -- Undo cool stuff here
        end,
        is_supported = function(lang)
          -- Check if the language is supported
        end
      }
    }
EOF
""" End of Adding modules ""

"""""""""""""""
"" Highlight ""
""''''''''''''''
" Consistent syntax highlighting. 
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
}
EOF
"" End of Highlight ""

"""""""""""""""""""""""""""
"" Incremental selection ""
"""""""""""""""""""""""""""
"" Incremental selection based on the named nodes from the grammar.
lua <<EOF
require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF
"" End of inclremental selection ""

"""""""""""""""""
"" Indentation ""
"""""""""""""""""
"" Tree-sitter based indentation.
lua <<EOF
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }
}
EOF
"" End of indentation ""

