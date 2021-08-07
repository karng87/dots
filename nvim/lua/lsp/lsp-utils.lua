vim.cmd('packadd nvim-lsputils')

local nvim_lsputils = {}

function nvim_lsputils.define_augroups(definitions) -- {{{1
    -- Create autocommand groups based on the passed definitions
    --
    -- The key will be the name of the group, and each definition
    -- within the group should have:
    --    1. Trigger
    --    2. Pattern
    --    3. Text
    -- just like how they would normally be defined from Vim itself
    for group_name, definition in pairs(definitions) do
        vim.cmd('augroup ' .. group_name)
        vim.cmd('autocmd!')

        for _, def in pairs(definition) do
            local command = table.concat(vim.tbl_flatten {'autocmd', def}, ' ')
            vim.cmd(command)
        end

        vim.cmd('augroup END')
    end
end

-- lsp

function nvim_lsputils.add_to_workspace_folder()
    vim.lsp.buf.add_workspace_folder()
end

function nvim_lsputils.clear_references()
    vim.lsp.buf.clear_references()
end

function nvim_lsputils.code_action()
    vim.lsp.buf.code_action()
end

function nvim_lsputils.declaration()
    vim.lsp.buf.declaration()
    vim.lsp.buf.clear_references()
end

function nvim_lsputils.definition()
    vim.lsp.buf.definition()
    vim.lsp.buf.clear_references()
end

function nvim_lsputils.document_highlight()
    vim.lsp.buf.document_highlight()
end

function nvim_lsputils.document_symbol()
    vim.lsp.buf.document_symbol()
end

function nvim_lsputils.formatting()
    vim.lsp.buf.formatting()
end

function nvim_lsputils.formatting_sync()
    vim.lsp.buf.formatting_sync()
end

function nvim_lsputils.hover()
    vim.lsp.buf.hover()
end

function nvim_lsputils.implementation()
    vim.lsp.buf.implementation()
end

function nvim_lsputils.incoming_calls()
    vim.lsp.buf.incoming_calls()
end

function nvim_lsputils.list_workspace_folders()
    vim.lsp.buf.list_workspace_folders()
end

function nvim_lsputils.outgoing_calls()
    vim.lsp.buf.outgoing_calls()
end

function nvim_lsputils.range_code_action()
    vim.lsp.buf.range_code_action()
end

function nvim_lsputils.range_formatting()
    vim.lsp.buf.range_formatting()
end

function nvim_lsputils.references()
    vim.lsp.buf.references()
    vim.lsp.buf.clear_references()
end

function nvim_lsputils.remove_workspace_folder()
    vim.lsp.buf.remove_workspace_folder()
end

function nvim_lsputils.rename()
    vim.lsp.buf.rename()
end

function nvim_lsputils.signature_help()
    vim.lsp.buf.signature_help()
end

function nvim_lsputils.type_definition()
    vim.lsp.buf.type_definition()
end

function nvim_lsputils.workspace_symbol()
    vim.lsp.buf.workspace_symbol()
end

-- diagnostic

function nvim_lsputils.get_all()
    vim.lsp.diagnostic.get_all()
end

function nvim_lsputils.get_next()
    vim.lsp.diagnostic.get_next()
end

function nvim_lsputils.get_prev()
    vim.lsp.diagnostic.get_prev()
end

function nvim_lsputils.goto_next()
    vim.lsp.diagnostic.goto_next()
end

function nvim_lsputils.goto_prev()
    vim.lsp.diagnostic.goto_prev()
end

function nvim_lsputils.show_line_diagnostics()
    vim.lsp.diagnostic.show_line_diagnostics()
end

-- git signs

function nvim_lsputils.next_hunk()
    require('gitsigns').next_hunk()
end

function nvim_lsputils.prev_hunk()
    require('gitsigns').prev_hunk()
end

function nvim_lsputils.stage_hunk()
    require('gitsigns').stage_hunk()
end

function nvim_lsputils.undo_stage_hunk()
    require('gitsigns').undo_stage_hunk()
end

function nvim_lsputils.reset_hunk()
    require('gitsigns').reset_hunk()
end

function nvim_lsputils.reset_buffer()
    require('gitsigns').reset_buffer()
end

function nvim_lsputils.preview_hunk()
    require('gitsigns').preview_hunk()
end

function nvim_lsputils.blame_line()
    require('gitsigns').blame_line()
end

-- misc
function nvim_lsputils.file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

return nvim_lsputils
