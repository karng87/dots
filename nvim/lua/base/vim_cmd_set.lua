vim.g.mapleader = ','
--local function set(key, value)
--	if value == true or value == nil then
--		vim.cmd(string.format('set %s', key))
--	elseif value == false then
--		vim.cmd(string.format('set no%s', key))
--	else
--		vim.cmd(string.format('set %s=%s', key, value))
--	end
--end
-- Necessary to work
U.set 'hidden'
U.set 'wrap'
U.set 'autoread'
U.set 'undofile'
U.set ('swapfile', false)
U.set ('backup', false)
U.set ('completeopt', 'menu,menuone,noselect')

-- Tabs configuration
U.set ('softtabstop', 2)
U.set ('shiftwidth', 2)
U.set 'expandtab'
U.set 'autoindent'
U.set 'cindent'

-- Search configuration
U.set ('hlsearch', false)
U.set 'ignorecase'
U.set 'smartcase'
U.set ('inccommand', 'split')
U.set 'incsearch'

-- Looks and feels
U.set ('cmdheight', 1)
U.set 'number'
U.set 'relativenumber'
U.set 'splitright'
U.set 'splitbelow'
U.set ('updatetime', '1000')
U.set 'showcmd'
U.set ('showmode', false)
--U.set ('colorcolumn', '80')
vim.o.shortmess = vim.o.shortmess .. "c"