-- Test file the currently file
vim.api.nvim_set_keymap(
    'n',
    '<leader>t',
    ,'<Plug>PlenaryTestFile',
    {nnoremap = false, silent = true}
)
