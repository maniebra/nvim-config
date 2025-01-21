-- SHORCUTS
-- INSERT
vim.api.nvim_set_keymap('i', '<C-S>', '<ESC>:w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true, silent = true })

-- NORMAL
vim.api.nvim_set_keymap('n', '<C-G><C-A>', ':Git add .<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-G><C-P>', ':Git push<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-G><C-S>', function()
    local commit_message = vim.fn.input('Commit message: ', '# ')
    if commit_message ~= '' then
        vim.cmd('Git commit -m "' .. commit_message .. '"')
    else
        print('Commit canceled.')
    end
end, { noremap = true, silent = true, desc = "Git commit with dynamic message" })

vim.api.nvim_set_keymap('n', '<F5>', ':make<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-T><C-D>', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-S>', ':w<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', "<c-`>", ':FloatermToggle<CR>', {noremap = true, silent = true})

-- TERMINAL
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-N>:q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', 'jk', '<C-\\><C-N>:q<CR>', { noremap = true, silent = true })
