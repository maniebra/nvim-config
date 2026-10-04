vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.o.shell = '/bin/zsh -i'

vim.o.signcolumn = 'yes'
vim.o.number = true
vim.o.relativenumber = true
vim.o.clipboard = 'unnamedplus'

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.floaterm_shell = 'zsh'


-- Indenting
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.softtabstop = 4

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "yaml", "yml", "javascript", "typescript", "javascriptreact", "typescriptreact" },
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
    end,
})

vim.o.virtualedit = "onemore"

-- Don't let a missing/broken colorscheme abort the rest of the config.
if not pcall(vim.cmd.colorscheme, 'tokyonight') then
    vim.notify("tokyonight not available, using default colorscheme", vim.log.levels.WARN)
end
