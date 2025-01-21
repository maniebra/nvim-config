-- SHORCUTS
-- INSERT
vim.keymap.set('i', '<C-S>', '<ESC>:w<CR><I>', { noremap = true, silent = true, desc = "Save file" })
vim.keymap.set('i', 'jk', '<ESC>', { noremap = true, silent = true, desc = "Exit insert mode" })

-- NORMAL
vim.keymap.set('n', '<C-G><C-A>', ':Git add .<CR>', { noremap = true, silent = true, desc = "Git add: all files in currect directory"})
vim.keymap.set('n', '<C-G><C-P>', ':Git push<CR>', { noremap = true, silent = true, desc = "Git push" })
vim.keymap.set('n', '<C-G><C-S>', function()
    local commit_message = vim.fn.input('Commit message: ', '#')
    if commit_message ~= '' then
        vim.cmd('Git commit -m "' .. commit_message .. '"')
    else
        print('Commit canceled.')
    end
end, { noremap = true, silent = true, desc = "Git commit with dynamic message" })

vim.keymap.set('n', '<F5>', ':make<CR>', { noremap = true, silent = true, desc = "Execute all in Makefile" })

vim.keymap.set('n', '<C-T><C-D>', ':NvimTreeFindFile<CR>', { noremap = true, silent = true, desc = "Open NvimTree file tree" })

vim.keymap.set('n', '<C-S>', ':w<CR>', { noremap = true, silent = true, desc = "Save file" })

vim.keymap.set('n', "<c-`>", ':FloatermToggle<CR>', {noremap = true, silent = true, desc = "Open floating terminal" })

-- TERMINAL
vim.keymap.set('t', '<ESC>', '<C-\\><C-N>:q<CR>', { noremap = true, silent = true, desc = "Exit terminal" })
vim.keymap.set('t', 'jk', '<C-\\><C-N>:q<CR>', { noremap = true, silent = true, desc = "Exit terminal" })
