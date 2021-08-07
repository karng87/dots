vim.cmd("packadd! nvim-lspconfig")

local lsp = require'lspconfig'
local opts = {noremap = true, silent = true }

---- For snippet support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- configuring diagnostics
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = true,
    signs = true,
    --update_in_insert = false,
    update_in_insert = true,
  }
)

-- configuring LSP servers
local on_attach_config = function(client, bufnr)
  print("LSP started.");
  vim.fn.sign_define("LspDiagnosticsSignError", {text = "", texthl = "GruvboxRed"})
  vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", texthl = "GruvboxYellow"})
  vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", texthl = "GruvboxBlue"})
  vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", texthl = "GruvboxAqua"})

  --vim.lsp.diagnostic.set_signs(vim.lsp.diagnostic.get(bufnr, client), bufnr, client)

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- GOTO mappings
  -- declaration is what move to code
 vim.api.nvim_buf_set_keymap(bufnr, 'n','<leader>gg','<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
 vim.api.nvim_buf_set_keymap(bufnr, 'n','<leader>gd','<cmd>lua vim.lsp.buf.definition()<CR>', opts)
 vim.api.nvim_buf_set_keymap(bufnr, 'n','<leader>gh','<cmd>lua vim.lsp.buf.hover()<CR>', opts)
 vim.api.nvim_buf_set_keymap(bufnr, 'n','<leader>gr','<cmd>lua vim.lsp.buf.references()<CR>', opts)
 vim.api.nvim_buf_set_keymap(bufnr, 'n','<leader>gs','<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
 vim.api.nvim_buf_set_keymap(bufnr, 'n','<leader>gi','<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
 vim.api.nvim_buf_set_keymap(bufnr, 'n','<leader>gt','<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
 vim.api.nvim_buf_set_keymap(bufnr, 'n','<leader>gcd','<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
 vim.api.nvim_buf_set_keymap(bufnr, 'n','<leader>gw','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
  -- ACTION mappings
 vim.api.nvim_buf_set_keymap(bufnr, 'n','<leader>ga','<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
 vim.api.nvim_buf_set_keymap(bufnr, 'n','<leader>gr','<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- Few language severs support these three
 vim.api.nvim_buf_set_keymap(bufnr, 'n','<leader>gcf','<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
 vim.api.nvim_buf_set_keymap(bufnr, 'n','<leader>gci','<cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts)
 vim.api.nvim_buf_set_keymap(bufnr, 'n','<leader>gco','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', opts)
  -- Diagnostics mapping
 vim.api.nvim_buf_set_keymap(bufnr, 'n','<leader>gl','<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
 vim.api.nvim_buf_set_keymap(bufnr, 'n','<leader>gn','<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
 vim.api.nvim_buf_set_keymap(bufnr, 'n','<leader>gp','<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
-- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gf', "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gf', "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

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

-- local on_attach = function()
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
--local on_attach_completion = function(_)
--  -- passing in a table with on_attach function
--  require'completion'.on_attach({
--    sorting = 'alphabet',
--    matching_strategy_list = {'exact', 'fuzzy'},
--    chain_complete_list = chain_complete_list,
--    })
--end

local on_attach = function(client, bufnr)
  on_attach_config(client, bufnr)
  --on_attach_completion()
end

local on_attach_clangd = function(client, bufnr)
 vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>sh', '<cmd>ClangdSwitchSourceHeader<CR>', opts)
  on_attach(client, bufnr)
end

-- https://sarcasm.github.io/notes/dev/compilation-database.html#clang
lsp.clangd.setup{
  on_attach = on_attach_clangd,
  --handlers = {
  --  ["textDocument/publishDiagnostics"] =
  --    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  --                              virtual_text = true,
  --                              signs = true,
  --                              underline = true,
  --                              update_in_insert = true })
  --},
  init_options = { clangdFileStatus = true },
  cmd = {"clangd",
    			"--background-index",
    			"--suggest-missing-includes",
    			"--clang-tidy",
    			"--header-insertion=iwyu"
    	},
  filetypes = {"c", "cpp", "objc", "objcpp"},
  root_dir = lsp.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git", "LICENSE")
}

lsp.vimls.setup {
  on_attach = on_attach,
  cmd = { "vim-language-server", "--stdio" },
  docs = { description = "https://github.com/iamcco/vim-language-server\n\nIf you don't want to use Nvim to install it, then you can use:\n```sh\nnpm install -g vim-language-server\n```\n" },
  filetypes = { "vim" },
  root_dir = lsp.util.root_pattern("strange-root-pattern", ".git", "autoload", "plugin", "LICENSE"),
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
  },
  capabilities = capabilities
}

lsp.cmake.setup{
  on_attach = on_attach,
  cmd = { "cmake-language-server" },
  filetypes = { "cmake" },
  root_dir = lsp.util.root_pattern(".git", "compile_commands.json", "build/", "LICENSE"),
  init_options = {
    buildDirectory = "build",
  }
}

lsp.sumneko_lua.setup{
  on_attach = on_attach,
  cmd = { "/home/jkarng/lua/lua-language-server/bin/Linux/lua-language-server", "-E", "/home/jkarng/lua/lua-language-server/main.lua" },
  filetypes = { "lua" },
  log_level = 2,
  root_dir = lsp.util.root_pattern("LICENSE", ".git"),
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

lsp.texlab.setup{
  on_attach = on_attach,
  cmd = { "texlab" },
  filetypes = { "tex", "bib" },
}

lsp.bashls.setup{
  on_attach = on_attach,
}

local function lsp_reload(buffer)
  vim.lsp.stop_client(vim.lsp.get_active_clients(buffer))
  vim.cmd("edit")
end

local function lsp_stop(buffer)
  vim.lsp.diagnostic.clear(buffer)
  vim.lsp.stop_client(vim.lsp.get_active_clients(buffer))
end

return{
  lsp_reload = lsp_reload,
  lsp_stop = lsp_stop
}


-- https://sarcasm.github.io/notes/dev/compilation-database.html#clang
	-- lsp.ccls.setup{
    --     on_attach = on_attach,
	-- 	init_options = {
	-- 		compilationDatabaseDirectory = "build";
	-- 		index = { threads = 0; };
	-- 		clang = { excludeArgs = { "-frounding-math"} ; };
	-- 	},
	-- 	cmd = { "ccls" },
	-- 	filetypes = { "c", "cpp", "objc", "objcpp" },
	-- 	root_dir = lsp.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git", "LICENSE"),
	-- }
