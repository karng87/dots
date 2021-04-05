vim.g.mapleader = ','
local function set(key, value)
	if value == true or value == nil then
		vim.cmd(string.format('set %s', key))
	elseif value == false then
		vim.cmd(string.format('set no%s', key))
	else
		vim.cmd(string.format('set %s=%s', key, value))
	end
end
-- Necessary to work
set 'hidden'
set 'wrap'
set 'autoread'
set 'undofile'
set ('swapfile', false)
set ('backup', false)
set ('completeopt', 'menu,menuone,noselect')

-- Tabs configuration
set ('softtabstop', 2)
set ('shiftwidth', 2)
set 'expandtab'
set 'autoindent'
set 'cindent'

-- Search configuration
set ('hlsearch', false)
set 'ignorecase'
set 'smartcase'
set ('inccommand', 'split')
set 'incsearch'

-- Looks and feels
set ('cmdheight', 1)
set 'number'
set 'relativenumber'
set 'splitright'
set 'splitbelow'
set ('updatetime', '1000')
set 'showcmd'
set ('showmode', false)
set ('colorcolumn', '80')

return set
