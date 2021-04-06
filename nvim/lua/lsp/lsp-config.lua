vim.cmd("packadd! nvim-lspconfig")

local lsp = require'lspconfig'

-- For snippet support
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

  --vim.fn.sign_define("LspDiagnosticsSignError", {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"})
  --vim.fn.sign_define("LspDiagnosticsSignWarning", {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"})
  --vim.fn.sign_define("LspDiagnosticsSignHint", {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"})
  --vim.fn.sign_define("LspDiagnosticsSignInformation", {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"})
  --vim.fn.sign_define("LspDiagnosticsErrorSign", {text = "whatever", texthl = "LspDiagnosticsError"})

  vim.lsp.diagnostic.set_signs(vim.lsp.diagnostic.get(bufnr, client), bufnr, client)

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- GOTO mappings
 U.buf_map(bufnr, 'n','<leader>gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
 U.buf_map(bufnr, 'n','<leader>gd','<cmd>lua vim.lsp.buf.definition()<CR>')
 U.buf_map(bufnr, 'n','<leader>gh','<cmd>lua vim.lsp.buf.hover()<CR>')
 U.buf_map(bufnr, 'n','<leader>gr','<cmd>lua vim.lsp.buf.references()<CR>')
 U.buf_map(bufnr, 'n','<leader>gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
 U.buf_map(bufnr, 'n','<leader>gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
 U.buf_map(bufnr, 'n','<leader>gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
 U.buf_map(bufnr, 'n','<leader>gds','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
 U.buf_map(bufnr, 'n','<leader>gws','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')

 U.buf_map(bufnr, 'i','<leader>gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
 U.buf_map(bufnr, 'i','<leader>gd','<cmd>lua vim.lsp.buf.definition()<CR>')
 U.buf_map(bufnr, 'i','<leader>gh','<cmd>lua vim.lsp.buf.hover()<CR>')
 U.buf_map(bufnr, 'i','<leader>gr','<cmd>lua vim.lsp.buf.references()<CR>')
 U.buf_map(bufnr, 'i','<leader>gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
 U.buf_map(bufnr, 'i','<leader>gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
 U.buf_map(bufnr, 'i','<leader>gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
 U.buf_map(bufnr, 'i','<leader>gds','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
 U.buf_map(bufnr, 'i','<leader>gws','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
  -- ACTION mappings
 U.buf_map(bufnr, 'n','<leader>ac','<cmd>lua vim.lsp.buf.code_action()<CR>')
 U.buf_map(bufnr, 'n','<leader>ar','<cmd>lua vim.lsp.buf.rename()<CR>')
  -- Few language severs support these three
 U.buf_map(bufnr, 'n','<leader>gf','<cmd>lua vim.lsp.buf.formatting()<CR>')
 U.buf_map(bufnr, 'n','<leader>gi','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
 U.buf_map(bufnr, 'n','<leader>go','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
  -- Diagnostics mapping
 U.buf_map(bufnr, 'n','<leader>ge','<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
 U.buf_map(bufnr, 'n','<leader>gn','<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
 U.buf_map(bufnr, 'n','<leader>gp','<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
-- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
   U.buf_map("n", "<leader>gf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
  elseif client.resolved_capabilities.document_range_formatting then
   U.buf_map("n", "<leader>gf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>")
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

-- local on_attach = function()
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

local on_attach_completion = function(_)
  -- passing in a table with on_attach function
  require'completion'.on_attach({
    sorting = 'alphabet',
    matching_strategy_list = {'exact', 'fuzzy'},
    chain_complete_list = chain_complete_list,
    })
end

local on_attach = function(client, bufnr)
  on_attach_config(client, bufnr)
  on_attach_completion()
end

local on_attach_clangd = function(client, bufnr)
 U.buf_map('n', '<leader>sh', '<cmd>ClangdSwitchSourceHeader<CR>')
  on_attach(client, bufnr)
end

-- https://sarcasm.github.io/notes/dev/compilation-database.html#clang
lsp.clangd.setup{
  on_attach = on_attach_clangd,
  handlers = {
    ["textDocument/publishDiagnostics"] =
      vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                                virtual_text = true,
                                signs = true,
                                underline = true,
                                update_in_insert = true })
  },
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
  init_options = {
          buildDirectory = "build",
          -- root_dir = nvim_lsp.util.root_pattern(".git", "compile_commands.json", "build", "LICENSE")
  }
}

lsp.sumneko_lua.setup{
  on_attach = on_attach,
  cmd = { "lua-language-server", "-E", "/usr/share/lua-language-server/main.lua" },
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
  settings = {
    latex = {
      build = {
        onSave = true;
      }
    }
  }
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
