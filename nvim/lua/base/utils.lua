local U = {}
-- vim.api.nvim_[buf, win]_set_option()
U.set = function(key, value)
  if value == true or value == nil then
    vim.cmd(string.format('set %s', key))
  elseif value == false then
    vim.cmd(string.format('set no%s', key))
  else
    vim.cmd(string.format('set %s=%s', key, value))
  end
end
--U.let = function(key, value, mod)
--  if mod == 'g' or mod == nil then
--    vim.cmd(string.format('let g:%s=%s', key, value))
--  elseif mod == "w" then
--    vim.cmd(string.format('let w:%s=%s', key, value))
--  elseif mod == "t" then
--    vim.cmd(string.format('let t:%s=%s', key, value))
--  elseif mod == "l" then
--    vim.cmd(string.format('let l:%s=%s', key, value))
--  elseif mod == "s" then
--    vim.cmd(string.format('let s:%s=%s', key, value))
--  elseif mod == "a" then
--    vim.cmd(string.format('let a:%s=%s', key, value))
--  elseif mod == "v" then
--    vim.cmd(string.format('let v:%s=%s', key, value))
--  elseif mod == "&" then
--    vim.cmd(string.format('let &%s=%s', key, value))
--  elseif mod == "@" then
--    vim.cmd(string.format('let @%s=%s', key, value))
--  else
--    print('let error!!')
--  end
--end

U.let_g = function(key, value)
  if val=='del' then
    vim.api.nvim_del_var(key, value)
  else 
    vim.api.nvim_set_var(key, value)
  end
  -- vim.api.nvim_get_var()
end
U.let_b = function(key, value)
  if(val=='del') then
    vim.api.nvim_buf_del_var(key, value)
  else 
    vim.api.nvim_buf_set_var(key, value)
  end
  -- vim.api.nvim_buf_get_var()
end
U.let_w = function(key, value)
  if(val=='del') then
    vim.api.nvim_win_del_var(key, value)
  else 
    vim.api.nvim_win_set_var(key, value)
  end
  -- vim.api.nvim_get_var()
end
U.let_t = function(key, value)
  if(val=='del') then
    vim.api.nvim_tabpage_del_var(key, value)
  else 
    vim.api.nvim_tabpage_set_var(key, value)
  end
  -- vim.api.nvim_tabpage_get_var()
end
U.let_v = function(key, value) -- predefined vim variables(v:)
    vim.api.nvim_set_vvar(key, value)
  -- vim.api.nvim_get_vvar()
end


U.map = function(mod, lhs, rhs, expr)
  vim.api.nvim_set_keymap(mod, lhs, rhs, {noremap=true, silent=true, expr=expr})
end
U.map_lua = function(mod, lhs, action, expr)
  map(mod, lhs, '<cmd>lua '..action..'<cr>', expr)
end

U.buf_map = function(mod, lhs, rhs, expr)
  vim.api.nvim_buf_set_keymap('0', mod, lhs, rhs, {noremap=true, silent=true, expr=expr})
end

-- aucmd {event-Buf,File,Win,Tab,Focus,Cursor,..} {pat-filename} {cmd}
U.augroup = function(aucmds, name)
  vim.cmd('augroup ' .. name)
  vim.cmd('autocmd!') -- removes all existing autocommands in the group, and allows one to start afresh.
  for _, aucmd in ipairs(aucmds) do
    vim.cmd('autocmd ' .. table.concat(cmd, ' '))
  end
  vim.cmd('augroup END')
end
-- _G.utils = U
return U
