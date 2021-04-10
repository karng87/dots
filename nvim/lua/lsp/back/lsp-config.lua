vim.cmd("packadd! nvim-lspconfig")
--vim.cmd("packadd! completion-nvim")
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


-- configuring LSP servers
local on_attach_common = function(_)
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
local on_attach_clangd = function(client)
  map('n', '<leader>sh', '<cmd>ClangdSwitchSourceHeader<CR>')
  on_attach_common(client)
end
lsp.clangd.setup{
  on_attach = on_attach_clangd,
}
lsp.tsserver.setup{on_attach=on_attach_common}
lsp.html.setup{
  on_attach=on_attach_common,
  capabilities = capabilities,
}
lsp.cssls.setup{
  on_attach=on_attach_common,
  capabilities = capabilities,
}
lsp.gopls.setup{on_attach=on_attach_common}
lsp.pyls.setup{
  on_attach = on_attach_common,
}

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end
local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"
lsp.sumneko_lua.setup({
  cmd = { "lua-language-server", "-E", "/usr/share/lua-language-server/main.lua" },
  --cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = { "vim" },
      },
    }
  },

  on_attach = on_attach_common
})

lsp.texlab.setup{
  on_attach = on_attach_common,
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
