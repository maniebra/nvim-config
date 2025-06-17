-- SHORCUTS
-- INSERT
vim.keymap.set('i', '<C-S>', '<ESC>:w<CR><I>', { noremap = true, silent = true, desc = "Save file" })
vim.keymap.set('i', 'jk', '<ESC>', { noremap = true, silent = true, desc = "Exit insert mode" })

-- NORMAL
vim.keymap.set('n', '<C-G><C-A>', ':Git add .<CR>',
    { noremap = true, silent = true, desc = "Git add: all files in currect directory" })
vim.keymap.set('n', '<C-G><C-P>', ':Git push<CR>', { noremap = true, silent = true, desc = "Git push" })
vim.keymap.set('n', '<C-G><C-S>', function()
    local commit_message = vim.fn.input('Commit message: ', '#')
    if commit_message ~= '' then
        vim.cmd('Git commit -m "' .. commit_message .. '"')
    else
        print('Commit canceled.')
    end
end, { noremap = true, silent = true, desc = "Git commit with dynamic message" })
vim.keymap.set('n', '<C-G><C-G>', function()
    local commit_message = vim.fn.input('Commit message: ', '#')
    if commit_message ~= '' then
        vim.cmd(':Git add .')
        vim.cmd('Git commit -a -m "' .. commit_message .. '"')
    else
        print('Invalid commit')
    end
    vim.cmd(':Git push')
end, { noremap = true, silent = true, desc = "Git add-commit-push" })

vim.keymap.set('n', '<C-G><C-M>', function()
    local commit_message = vim.fn.input('Commit message: ', 'KOSE NANE POORI')
    if commit_message ~= '' then
        vim.cmd(':Git add .')
        vim.cmd('Git commit -a -m "' .. commit_message .. '"')
    else
        print('Invalid commit')
    end
    vim.cmd(':Git push')
end, { noremap = true, silent = true, desc = "Git add-commit-push" })

-- RUNNERS
vim.keymap.set('n', '<F5>', ':make<CR>', { noremap = true, silent = true, desc = "Execute all in Makefile" })
vim.keymap.set('n', '<F6>', ':make build<CR>', { noremap = true, silent = true, desc = "Execute build in Makefile" })
vim.keymap.set('n', '<F7>', ':make run<CR>', { noremap = true, silent = true, desc = "Execute run in Makefile" })

local function get_venv_activate()
    local paths = { ".venv", "venv", "env" }
    for _, p in ipairs(paths) do
        local activate = p .. "/bin/activate"
        if vim.fn.filereadable(activate) == 1 then
            return activate
        end
    end
    return nil
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    callback = function()
        vim.keymap.set('n', '<F5>', ':!pnpm run<CR>',
            { buffer = true, noremap = true, silent = true, desc = "Run pnpm script" })
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python" },
    callback = function()
        local venv = get_venv_activate()
        if venv then
            vim.keymap.set('n', '<F5>', ':!source ' .. venv .. ' && python main.py<CR>',
                { buffer = true, noremap = true, silent = true, desc = "Run main.py with venv" })
        else
            vim.keymap.set('n', '<F5>', ':!python main.py<CR>',
                { buffer = true, noremap = true, silent = true, desc = "Run main.py" })
        end
    end
})

vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        if vim.fn.filereadable("manage.py") == 1 then
            local venv = get_venv_activate()
            if venv then
                vim.keymap.set('n', '<F5>', ':!source ' .. venv .. ' && python manage.py runserver<CR>',
                    { buffer = true, noremap = true, silent = true, desc = "Run Django server with venv" })
            else
                vim.keymap.set('n', '<F5>', ':!python manage.py runserver<CR>',
                    { buffer = true, noremap = true, silent = true, desc = "Run Django server" })
            end
        end
    end
})

vim.keymap.set('n', '<C-T><C-D>', ':NvimTreeFindFile<CR>',
    { noremap = true, silent = true, desc = "Open NvimTree file tree" })

vim.keymap.set('n', '<C-S>', ':w<CR>', { noremap = true, silent = true, desc = "Save file" })

vim.keymap.set('n', "<c-`>", ':FloatermToggle<CR>', { noremap = true, silent = true, desc = "Open floating terminal" })

vim.keymap.set("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

vim.keymap.set("n", "<leader>cS", "<cmd>Themery <CR>", { desc = "Change theme" })

-- TERMINAL
vim.keymap.set('t', '<ESC>', '<C-\\><C-N>:q<CR>', { noremap = true, silent = true, desc = "Exit terminal" })
vim.keymap.set('t', 'jk', '<C-\\><C-N>:q<CR>', { noremap = true, silent = true, desc = "Exit terminal" })

-- TOOLCHAIN
vim.keymap.set('n', '<C-P><C-P>', ':!pre-commit run --all-files<CR>',
    { noremap = true, silent = true, desc = "Run pre-commit" })

-- COMMENTS
vim.keymap.set("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
vim.keymap.set("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- mouse users + nvimtree users!
vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
    require('menu.utils').delete_old_menus()

    vim.cmd.exec '"normal! \\<RightMouse>"'

    -- clicked buf
    local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
    local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

    require("menu").open(options, { mouse = true })
end, {})

-- SEARCH
vim.keymap.set("n", 'xx/', ':nohlsearch<CR>', { silent = true, desc = "Clear search highlight" })

vim.keymap.set('x', '<leader>cc', ':CodeSnap<CR>', { desc = "CodeSnap Image saved to clipboard" })
vim.keymap.set('x', '<leader>cs', ':CodeSnapSave<CR>', { desc = "CodeSnap Image saved to pics dir" })

vim.keymap.set('n', '<C-T><C-T>', ':tabnew<CR><C-T><C-D><C-W><C-W>', { desc = "open a new tab", remap = true })
vim.keymap.set('i', '<C-T><C-T>', ':tabnew<CR><C-T><C-D><C-W><C-W>', { desc = "open a new tab", remap = true })

-- TELESCOPE

vim.keymap.set("n", '<leader>tt', ':Telescope<CR>', { desc = "open telescope", remap = true })
vim.keymap.set("n", '<leader>tf', ':Telescope fd<CR>', { desc = "open telescope", remap = true })
vim.keymap.set("n", '<leader>tvo', ':Telescope vim_options<CR>', { desc = "open telescope", remap = true })


-- INSERT MODE MOVEMENT
vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-k>', '<Up>')
vim.keymap.set('i', '<C-l>', '<Right>')

-- LSP keymaps
vim.keymap.set('v', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('v', '<leader>ft', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>ft', function()
  vim.lsp.buf.format({ async = true })
end, { desc = 'Format buffer', noremap = true, silent = true })
