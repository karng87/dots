-------------
-- options --
-------------
-- vim.cmd ('colorscheme nord')

vim.cmd('filetype plugin indent on')
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.hidden = true
vim.o.whichwrap = '<,>,[,]'
vim.o.pumheight = 10
vim.o.cmdheight = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.opt.termguicolors = true
vim.o.fileencoding = 'utf-8'
vim.o.conceallevel = 0
vim.o.showtabline = 2
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
-- vim.o.timeoutlen = 100
vim.o.clipboard = "unnamedplus"
-- vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.sidescrolloff = 5
vim.o.mouse = "a"
vim.o.cursorline = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true
vim.bo.tabstop = 2

vim.wo.wrap = false
vim.wo.number = true
vim.wo.signcolumn = "yes"
vim.g.vsnip_snippet_dir = "$HOME/.config/nvim/vsnip/"

-------------------
-- auto commands --
-------------------
vim.cmd [[
  au BufRead,BufNewFile *.nasm,*.asm,*.inc set ft=nasm,
  autocmd InsertEnter * set timeoutlen=100
  autocmd InsertLeave * set timeoutlen=1000
  autocmd CmdwinEnter * set timeoutlen=100
  autocmd CmdwinLeave * set timeoutlen=1000
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end
  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end
  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end
  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end
]]
---------------
-- find path --
---------------
vim.cmd(string.format('set %s', 'path+=$HOME/.config/nvim/**'))
vim.cmd(string.format('set %s', 'path+=$HOME/Project/dots/*'))
vim.cmd(string.format('set %s', 'path+=$HOME/Project/dots/dots/**'))
vim.cmd(string.format('set %s', 'path+=$HOME/Project/dots/etc/**'))
vim.cmd(string.format('set %s', 'path+=$HOME/Project/nasm-game/**'))
-- vim.cmd(string.format('set %s', 'path+=$HOME/Project/modern_x86_64_assembly/**'))
vim.cmd(string.format('set %s', 'path+=**'))
vim.cmd(string.format('set %s', 'wildignore+=**/build/**'))
vim.cmd(string.format('set %s', 'wildignore+=**/pack/**'))
vim.cmd(string.format('set %s', 'wildignore+=$HOME/.config/nvim/plugin/**'))
vim.cmd(string.format('set %s', 'wildignore+=**/.cache/**'))
vim.cmd(string.format('set %s', 'wildignore+=**/.git/**'))
vim.cmd(string.format('set %s', 'wildignore+=**/cmake/**'))
vim.cmd(string.format('set %s', 'wildignore+=**/cmake-scripts/**'))

--------------
-- key maps --
--------------
vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

local map = function(mod, lhs, rhs, expr)
  vim.api.nvim_set_keymap(mod, lhs, rhs, {noremap = true, silent = true, expr = expr})
end
-- 저장하고 앞 창으로 가기
map('n', [[<leader>h]], [[:up|winc h<cr>]])
map('t', [[<leader>h]], [[<c-\><c-n>>:winc h<cr>]])

-- 저장하고 앞뒤 창 위치 바꾸기
map('n', [[<leader>H]], [[:up|winc H<cr>]])
map('t', [[<leader>H]], [[<c-\><c-n>:winc H<cr>]])

map('n', [[<leader>j]], [[:up|winc j<cr>]])
map('t', [[<leader>j]], [[<c-\><c-n>:winc j<cr>]])
map('n', [[<leader>J]], [[:up|winc J<cr>]])
map('t', [[<leader>J]], [[<c-\><c-n>:winc J<cr>]])

map('n', [[<leader>k]], [[:up|winc k<cr>]])
map('t', [[<leader>k]], [[<c-\><c-n>:winc k<cr>]])
map('n', [[<leader>K]], [[:up|winc K<cr>]])
map('i', [[<leader>K]], [[<ESC>:up|winc K<cr>]])

map('n', [[<leader>l]], [[:up|winc l<cr>]])
map('t', [[<leader>l]], [[<c-\><c-n>:winc l<cr>]])
map('n', [[<leader>L]], [[:up|winc L<cr>]])
map('t', [[<leader>L]], [[<c-\><c-n>:winc L<cr>]])

map('n', [[<leader>q]], [[:q<cr>]])
map('t', [[<leader>q]], [[<c-\><c-n><cr>]])
map('c', [[<leader>q]], [[<c-u>q<cr>]])
map('v', [[<leader>q]], [[<ESC>:q<cr>]])
map('s', [[<leader>q]], [[<ESC>:q<cr>]])
map('x', [[<leader>q]], [[<ESC>:q<cr>]])

map('n', [[<leader>x]], [[:x<cr>]])
-- 단어 사전 찾기
map('n', [[<leader>w]], [["+yiw:botright new term://bash<cr>|idic <c-\><c-n>:put +<cr>i<cr>]])
map('t', [[<leader>w]], [[<c-u>dic <c-\><c-n>:put +<cr>|i<c-e><cr>]])

map('n', [[<leader>mh]], [[:up | set makeprg=ghci| make %<cr>]])
map('n', [[<leader>m]], [[:up | set makeprg=make| make<cr>]])
map('n', [[<leader>t]],
    [[:update | let @a=expand('%:p:h') | botright new term://bash<cr> | <esc>icd <c-\><c-n>:put a<cr>i<cr>]])

-- show
map('n', [[<leader>g]], [[:Lspsaga show_line_diagnostics<CR>]])

-- only show diagnostic if cursor is over the area
map('n', [[<leader>c]], [[<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>]])

-- jump diagnostic
map('n', '<leader>p', [[:Lspsaga diagnostic_jump_prev<CR>]])
map('n', '<leader>n', [[:Lspsaga diagnostic_jump_next<CR>]])

-- preview definition
map('n', [[<leader>d]], [[:Lspsaga preview_definition<CR>]])

-- show signature help
map('n', [[<leader>s]], [[:Lspsaga signature_help<CR>]])

-- show hover doc
map('n', [[<leader>v]], [[:Lspsaga hover_doc<CR>]])

-- scroll down hover doc or scroll in definition preview
map('n', [[<C-f>]], [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]])

-- scroll up hover doc
map('n', [[<C-b>]], [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]])

-- code action
map('n', [[<leader>a]], [[:Lspsaga code_action<CR>]])
map('v', [[<leader>a]], [[:<C-U>Lspsaga range_code_action<CR>]])

-- lsp provider to find the cursor word definition and reference
map('n', [[<leader>f]], [[:Lspsaga lsp_finder<CR>]])


-- ~/Project/dots/nvim/lua/base/gruvbox.lua
require'base.gruvbox'


vim.cmd('packadd nvim-web-devicons')
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

-- ~/Project/dots/nvim/lua/base/galaxyline.lua
require'base.galaxyline'
--vim.cmd('packadd popup')


--------------------
-- nvim-lspconfig --
--------------------

vim.cmd("packadd! nvim-lspconfig")

local lsp = require'lspconfig'
local opts = {noremap = true, silent = true }

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
end

local on_attach = function(client, bufnr)
  on_attach_config(client, bufnr)
  --on_attach_completion()
end

local on_attach_clangd = function(client, bufnr)
 vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>sh', '<cmd>ClangdSwitchSourceHeader<CR>', opts)
  on_attach(client, bufnr)
end

lsp.clangd.setup{
  on_attach = on_attach_clangd,
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
  }
}

lsp.pyright.setup{
  on_attach = on_attach,
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_dir = function(fname)
        local root_files = {
          'pyproject.toml',
          'setup.py',
          'setup.cfg',
          'requirements.txt',
          'Pipfile',
          'pyrightconfig.json',
        }
        return lsp.util.root_pattern(unpack(root_files))(fname) or lsp.util.find_git_ancestor(fname) or lsp.util.path.dirname(fname)
        end,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true
        }
      }
    }
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
  cmd = { "/home/jkarng/Lsp/lua/bin/lua-language-server", "-E", "/home/jkarng/Lsp/lua/bin/main.lua" },
  filetypes = { "lua" },
  log_level = 2,
  root_dir = lsp.util.root_pattern(".git"),
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

lsp.ltex.setup{ on_attach = on_attach, }
lsp.bashls.setup{ on_attach = on_attach, }
lsp.hls.setup{ on_attach = on_attach, }
--=========================================
---------------------
-- nvim-treesitter --
---------------------
vim.cmd("packadd! nvim-treesitter")
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  sync_install = false,
  ignore_install = { "javascript" },
  highlight = {
    enable = true,
    disable = { "c", "rust" },
    additional_vim_regex_highlighting = false,
  },
}
--=========================================
--------------------
-- cmp -lspconfig --
--------------------
vim.cmd("packadd! cmp-nvim-lsp")
vim.cmd("packadd! cmp-buffer")
vim.cmd("packadd! cmp-path")
vim.cmd("packadd! cmp-cmdline")
vim.cmd("packadd! nvim-cmp")
vim.cmd("packadd! cmp-vsnip")
vim.cmd("packadd! vim-vsnip")

-- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    require'lspconfig'.clangd.setup { capabilities = capabilities, }
    require'lspconfig'.hls.setup { capabilities = capabilities, }
    require'lspconfig'.ltex.setup { capabilities = capabilities, }

--=========================================
--------------------
-- lspsaga --
--------------------
vim.cmd("packadd! lspsaga.nvim")
  require('lspsaga').init_lsp_saga()
