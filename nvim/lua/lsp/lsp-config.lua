vim.cmd("packadd! nvim-lspconfig")
vim.cmd("packadd! completion-nvim")
vim.cmd("packadd! nvim-treesitter")

-- nvim-treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  }
}

-- define an chain complete list
local chain_complete_list = {
  default = {
    {complete_items = {'lsp', 'snippet'}},
    {complete_items = {'path'}, triggered_only = {'/'}},
    {complete_items = {'buffers'}},
  },
  string = {
    {complete_items = {'path'}, triggered_only = {'/'}},
  },
  comment = {},
}

-- local on_attach = function()

local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  -- passing in a table with on_attach function
  require'completion'.on_attach({
      sorting = 'alphabet',
      matching_strategy_list = {'exact', 'fuzzy'},
      chain_complete_list = chain_complete_list,
    })

	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<cr>', {noremap=true, silent=true})
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', {noremap=true, silent=true})
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', {noremap=true, silent=true})
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap=true, silent=true})
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {noremap=true, silent=true})
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', {noremap=true, silent=true})
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', {noremap=true, silent=true})
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', {noremap=true, silent=true})
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', {noremap=true, silent=true})
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap=true, silent=true})
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap=true, silent=true})
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', {noremap=true, silent=true})
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', {noremap=true, silent=true})
	vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', {noremap=true, silent=true})
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', {noremap=true, silent=true})

	-- Set some keybinds conditional on server capabilities
	  if client.resolved_capabilities.document_formatting then
		 vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap=true, silent=true})
	  elseif client.resolved_capabilities.document_range_formatting then
		 vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", {noremap=true, silent=true})
	  end

	-- Set autocommands conditional on server_capabilities
			--hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
			--hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
			--hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
	  if client.resolved_capabilities.document_highlight then
		 vim.api.nvim_exec([[
			hi LspReferenceRead cterm=bold ctermbg=red guibg=black
			hi LspReferenceText cterm=bold ctermbg=blue guibg=black
			hi LspReferenceWrite cterm=bold ctermbg=yellow guibg=black
			augroup lsp_document_highlight
			  autocmd! * <buffer>
			  autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
			  autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
		 ]], false)
	  end
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
	--	local servers = { "pyright", "ccls", "cmake" }
	--	for _, lsp in ipairs(servers) do
	--	  nvim_lsp[lsp].setup { on_attach = on_attach }
	--	end

	nvim_lsp.pyright.setup{
		on_attach = on_attach,
		cmd = { "pyright-langserver", "--stdio" },
		filetypes = { "python" },
		root_dir = nvim_lsp.util.root_pattern(".git", "LICENSE"),
		settings = {
		  python = {
			analysis = {
			  autoSearchPaths = true,
			  useLibraryCodeForTypes = true
			}
		  }
		}
	}

	nvim_lsp.cmake.setup{
		on_attach = on_attach,
		cmd = { "cmake-language-server" },
		filetypes = { "cmake" },
		init_options = {
			buildDirectory = "build",
			-- root_dir = nvim_lsp.util.root_pattern(".git", "compile_commands.json", "build", "LICENSE")
		}
	}

	nvim_lsp.sumneko_lua.setup{
		on_attach = on_attach,
		cmd = { "lua-language-server", "-E", "/usr/share/lua-language-server/main.lua" },
		filetypes = { "lua" },
		log_level = 2,
		root_dir = nvim_lsp.util.root_pattern("LICENSE", ".git"),
		settings = {
                Lua = {
                      runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT',
                        -- Setup your lua path
                        path = vim.split(package.path, ';'),
                  },
                  diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = {'vim'},
                  },
                  workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = {
                              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                              [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                        },
                  },
                },
		},

	}

	nvim_lsp.hls.setup{
        on_attach = on_attach,
		cmd = { "haskell-language-server-wrapper", "--lsp" },
		filetypes = { "haskell", "lhaskell" },
		-- lspinfo = <function 1>
		root_dir = nvim_lsp.util.root_pattern("*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml", "LICENSE"),
		settings = {
              languageServerHaskell = {
                formattingProvider = "ormolu"
              }
		}
	}

    nvim_lsp.vimls.setup {
        on_attach = on_attach,
        cmd = { "vim-language-server", "--stdio" },
        docs = { description = "https://github.com/iamcco/vim-language-server\n\nIf you don't want to use Nvim to install it, then you can use:\n```sh\nnpm install -g vim-language-server\n```\n" },
        filetypes = { "vim" },
        root_dir = nvim_lsp.util.root_pattern("strange-root-pattern", ".git", "autoload", "plugin", "LICENSE"),
        init_options = {
              diagnostic = { enable = true },
              indexes = 
              {
                count = 3,
                gap = 100,
                projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
                runtimepath = true,
              },
              iskeyword = "@,48-57,_,192-255,-#",
              runtimepath = "",
              suggest = { fromRuntimepath = true, fromVimruntime = true, },
              vimruntime = "",
        }
        -- capabilities = lsp_status.capabilities
   }


    nvim_lsp.tsserver.setup{
        on_attach = on_attach,
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
        root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git", "LICENSE")

    }

    -- -- https://sarcasm.github.io/notes/dev/compilation-database.html#clang
	-- nvim_lsp.ccls.setup{
    --     on_attach = on_attach,
	-- 	init_options = {
	-- 		compilationDatabaseDirectory = "build";
	-- 		index = { threads = 0; };
	-- 		clang = { excludeArgs = { "-frounding-math"} ; };
	-- 	},
	-- 	cmd = { "ccls" },
	-- 	filetypes = { "c", "cpp", "objc", "objcpp" },
	-- 	root_dir = nvim_lsp.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git", "LICENSE"),
	-- }

    -- https://sarcasm.github.io/notes/dev/compilation-database.html#clang
    nvim_lsp.clangd.setup{
      on_attach = on_attach,
      init_options = { clangdFileStatus = true },
      cmd = {"clangd",
				"--background-index",
				"--suggest-missing-includes",
				"--clang-tidy",
				"--header-insertion=iwyu"
		},
      filetypes = {"c", "cpp", "objc", "objcpp"},
		root_dir = nvim_lsp.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git", "LICENSE")
    }


      nvim_lsp.html.setup {
        on_attach = on_attach,
        cmd = { "html-languageserver", "--stdio"},
        filetypes = { "html" },
        init_options = {
          configurationSection = { "html", "css", "javascript" },
          embeddedLanguages = {
            css = true,
            javascript = true
          },
        },
        root_dir = nvim_lsp.util.root_pattern(".git", "LICENSE"),
        -- capabilities = lsp_status.capabilities
      }

