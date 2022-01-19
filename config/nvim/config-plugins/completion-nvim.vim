packadd! completion-nvim

"====================
"" completion-nvim ""
"====================
" lua require'lspconfig'.pyls.setup{on_attach=require'completion'.on_attach}
    " Use completion-nvim in every buffer
        autocmd BufEnter * lua require'completion'.on_attach()

    " Use <Tab> and <S-Tab> to navigate through popup menu
        inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
        inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


    " tab key is lsp pum (Pop Up Menu) in insert mode
    " <c-p> is tab key in insert mode
    "map <c-p> to manually trigger completion
        imap <silent> <c-p> <Plug>(completion_trigger)        

    " you want to use <Tab> as trigger keys
        imap <tab> <Plug>(completion_smart_tab)
        imap <s-tab> <Plug>(completion_smart_s_tab)
    " By default, completion-nvim respect the trigger character of your language server, 
    "   if you want more trigger characters, add it by
        " let g:completion_trigger_character = ['.', '::']
        augroup CompletionTriggerCharacter
            autocmd!
            autocmd BufEnter * let g:completion_trigger_character = ['.']
            autocmd BufEnter *.c,*.cpp let g:completion_trigger_character = ['.', '::']
        augroup end
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
let g:completion_matching_smart_case = 1
let g:completion_timer_cycle = 200 "default value is 80
let g:completion_auto_change_source = 1
let g:completion_chain_complete_list = {
    \ 'lua': {
    \    'func' : [
    \        {'complete_items': ['lsp']}],
    \    'default': [
    \       {'complete_items': ['lsp', 'snippet']}],
    \},
    \ 'default' : {
    \   'default': [
    \       {'complete_items': ['lsp', 'snippet']}],
    \   'comment': []
    \   }
    \}
"let g:completion_chain_complete_list = {
"    \ 'lua': {
"    \    'string': [
"    \        {'complete_items': ['buffers']},
"    \        {'mode': '<c-p>'},
"    \        {'mode': '<c-n>'}],
"    \    'func' : [
"    \        {'complete_items': ['lsp']}],
"    \    'default': [
"    \       {'complete_items': ['lsp', 'snippet']},
"    \       {'complete_items': ['buffers']},
"    \       {'mode': '<c-p>'},
"    \       {'mode': '<c-n>'}],
"    \},
"    \ 'default' : {
"    \   'default': [
"    \       {'complete_items': ['lsp', 'snippet']},
"    \       {'complete_items': ['buffers']},
"    \       {'mode': '<c-p>'},
"    \       {'mode': '<c-n>'}],
"    \   'comment': []
"    \   }
"    \}
