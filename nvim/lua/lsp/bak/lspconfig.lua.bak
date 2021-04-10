-- define an chain complete list
--
-- vim.api.nvim_command("autocmd BufEnter * lua require'completion'.on_attach();")
vim.cmd([[autocmd BufEnter * lua require'completion'.on_attach();]])
--vim.fn.nvim_buf_set_keymap('0','n','<expr> <Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]],{noremap=true, nowait=true})
--vim.fn.nvim_buf_set_keymap('0','n','<expr> <S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]],{noremap=true, nowait=true})
--vim.cmd([[augroup completiontriggercharacter
--            autocmd!
--            autocmd bufenter * let g:completion_trigger_character = ['.']
--            autocmd bufenter *.c,*.cpp let g:completion_trigger_character = ['.', '::']
--        augroup end]])

vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy', 'all'}
vim.g.completion_matching_smart_case = 1
vim.g.completion_timer_cycle = 200 -- "default value is 80
vim.g.completion_auto_change_source = 1
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

	vim.lsp.set_log_level("debug")

	local nvim_lsp = require('lspconfig')

	local on_attach = function(client, bufnr)
	  -- passing in a table with on_attach function
	  require'completion'.on_attach({ sorting = 'alphabet', matching_strategy_list = {'exact', 'fuzzy'}, chain_complete_list = chain_complete_list, })
        
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	  	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	  -- Mappings.
	  local opts = { noremap=true, silent=true }
		  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
		  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
		  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
		  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
		  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
		  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
		  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
		  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
		  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
		  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
		  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
		  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
		  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
		  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
		  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

	  -- Set some keybinds conditional on server capabilities

	  if client.resolved_capabilities.document_formatting then
		buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	  elseif client.resolved_capabilities.document_range_formatting then
		buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
	  end

	  -- Set autocommands conditional on server_capabilities

	  if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec([[
		  hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
		  hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
		  hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
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
		root_dir = nvim_lsp.util.root_pattern(".git"),
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
			-- root_dir = nvim_lsp.util.root_pattern(".git", "compile_commands.json", "build")
		}
	}

	nvim_lsp.sumneko_lua.setup{
		on_attach = on_attach,
		cmd = { "lua-language-server", "-E", "/usr/share/lua-language-server/main.lua" },
		filetypes = { "lua" },
		log_level = 2,
		root_dir = nvim_lsp.util.root_pattern(".git"),
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
		root_dir = nvim_lsp.util.root_pattern("*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml"),
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
        root_dir = nvim_lsp.util.root_pattern("strange-root-pattern", ".git", "autoload", "plugin"),
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
        root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")

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
	-- 	root_dir = nvim_lsp.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
	-- }

    -- https://sarcasm.github.io/notes/dev/compilation-database.html#clang
    nvim_lsp.clangd.setup{
        on_attach = on_attach,
        init_options = { clangdFileStatus = true },
        cmd = { "clangd", "--background-index" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
		root_dir = nvim_lsp.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git")
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
        root_dir = nvim_lsp.util.root_pattern(".git"),
        -- capabilities = lsp_status.capabilities
      }
