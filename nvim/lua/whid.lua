local whid = {}
function whid.hello()
	vim.api.nvim_command('echo "hello from lua"')
end

function whid.world()
	return 'World form Return value'
end

return whid
