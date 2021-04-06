vim.cmd("packadd! nvim-lspconfig")
vim.cmd("packadd! completion-nvim")

local lsp = require'lspconfig'

-- Utility servers
local map = function(type, key, value)
  vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end

-- For snippet support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- configuring diagnostics
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = true,
    signs = true,
    update_in_insert = false,
  }
)

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
-- configuring LSP servers
local on_attach_config = function(_)
  print("LSP started.");

  -- GOTO mappings
  map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
  map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
  map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
  map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
  map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
  map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
  map('n','<leader>gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
  map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
  -- ACTION mappings
  map('n','<leader>ah',  '<cmd>lua vim.lsp.buf.hover()<CR>')
  map('n','<leader>af', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  map('n','<leader>ar',  '<cmd>lua vim.lsp.buf.rename()<CR>')
  -- Few language severs support these three
  map('n','<leader>=',  '<cmd>lua vim.lsp.buf.formatting()<CR>')
  map('n','<leader>ai',  '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
  map('n','<leader>ao',  '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
  -- Diagnostics mapping
  map('n','<leader>ee', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
  map('n','<leader>en', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
  map('n','<leader>ep', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
end

-- local on_attach = function()
local on_attach_completion = function(client)
  -- passing in a table with on_attach function
  require'completion'.on_attach({
    sorting = 'alphabet',
    matching_strategy_list = {'exact', 'fuzzy'},
    chain_complete_list = chain_complete_list,
    })
  on_attach_config(client)
end

local on_attach = function(client)
	-- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
  elseif client.resolved_capabilities.document_range_formatting then
    map("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>")
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
  on_attach_completion(client)
end

local on_attach_clangd = function(client)
  map('n', '<leader>sh', '<cmd>ClangdSwitchSourceHeader<CR>')
  on_attach(client)
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

lsp.pyright.setup{
  on_attach = on_attach,
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_dir = lsp.util.root_pattern(".git", "LICENSE"),
  settings = {
    python = {
       analysis = {
         autoSearchPaths = true,
         useLibraryCodeForTypes = true
       }
    }
  }
}

lsp.tsserver.setup{
    on_attach = on_attach,
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    root_dir = lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git", "LICENSE")

}

lsp.html.setup {
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
  root_dir = lsp.util.root_pattern(".git", "LICENSE"),
  capabilities = capabilities
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
