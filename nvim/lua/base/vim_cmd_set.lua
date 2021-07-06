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
U.set ('tabstop', 2)
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
-- tab: <c-v>u2192, end of line: <c-v>u21b2
vim.cmd([[set listchars=tab:→\ ,eol:↲]])
vim.cmd([[set nobackup]])
vim.cmd([[set nowritebackup]])
vim.cmd([[set noswapfile]])
vim.cmd([[set noundofile]])

-- set tabsize by file type
--autocommand FileType markdown setlocal tabstop=4 shiftwidth=4  softtabstop=4 expandtab noignorecase,
--au FileType markdown setl ts=4 sw=4  sts=4 et noic autoindent cindent
vim.cmd([[au BufRead,BufNewFile *.md,*.MD,*.markdown setl ts=4 sw=4  sts=4 nocompatible noic]])
vim.cmd([[au BufRead,BufNewFile *.nasm,*.asm,*.inc set ft=nasm]])
