-- SHORCUTS
-- INSERT
vim.api.nvim_set_keymap('i', '<C-S>', '<ESC>:w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true, silent = true })

-- NORMAL
vim.api.nvim_set_keymap('n', '<C-G><C-A>', ':Git add .<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-G><C-S>', ':Git commit -m "# "', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-G><C-P>', ':Git push<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<F5>', ':make<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-T><C-D>', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-S>', ':w<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', "<c-`>", ':FloatermToggle<CR>', {noremap = true, silent = true})

-- TERMINAL
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-N>:q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', 'jk', '<C-\\><C-N>:q<CR>', { noremap = true, silent = true })
