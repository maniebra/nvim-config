-- SHORCUTS
-- INSERT
vim.keymap.set('i', '<C-S>', '<ESC>:w<CR><I>', { noremap = true, silent = true, desc = "Save file" })
vim.keymap.set('i', 'jk', '<ESC>', { noremap = true, silent = true, desc = "Exit insert mode" })

-- NORMAL
vim.keymap.set('n', '<C-G><C-A>', ':Git add .<CR>',
    { noremap = true, silent = true, desc = "Git add: all files in currect directory" })
vim.keymap.set('n', '<C-G><C-P>', ':Git push<CR>', { noremap = true, silent = true, desc = "Git push" })
-- shellescape keeps quotes/$ in a message from breaking (or running as) shell code.
local function git_commit(default, opts)
    return function()
        local msg = vim.fn.input('Commit message: ', default)
        if msg == '' then
            return vim.notify('Commit canceled.', vim.log.levels.WARN)
        end
        if opts.add then vim.cmd('Git add .') end
        vim.cmd('Git commit -a -m ' .. vim.fn.shellescape(msg))
        if opts.push then vim.cmd('Git push') end
    end
end

vim.keymap.set('n', '<C-G><C-S>', git_commit('#', {}),
    { noremap = true, silent = true, desc = "Git commit with dynamic message" })
vim.keymap.set('n', '<C-G><C-G>', git_commit('#', { add = true, push = true }),
    { noremap = true, silent = true, desc = "Git add-commit-push" })
vim.keymap.set('n', '<C-G><C-M>', git_commit('KOSE NANE POORI', { add = true, push = true }),
    { noremap = true, silent = true, desc = "Git add-commit-push (default message)" })

-- RUNNERS
vim.keymap.set('n', '<F5>', ':make<CR>', { noremap = true, silent = true, desc = "Execute all in Makefile" })
vim.keymap.set('n', '<F6>', ':make build<CR>', { noremap = true, silent = true, desc = "Execute build in Makefile" })
vim.keymap.set('n', '<F7>', ':make run<CR>', { noremap = true, silent = true, desc = "Execute run in Makefile" })

-- Buffer-local <F5>: prefixes the project venv when there is one.
local function run_map(cmd, desc)
    for _, p in ipairs({ ".venv", "venv", "env" }) do
        if vim.fn.filereadable(p .. "/bin/activate") == 1 then
            cmd = "source " .. p .. "/bin/activate && " .. cmd
            break
        end
    end
    vim.keymap.set('n', '<F5>', ':!' .. cmd .. '<CR>',
        { buffer = true, noremap = true, silent = true, desc = desc })
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
        if vim.fn.filereadable("manage.py") == 1 then
            run_map("python manage.py runserver", "Run Django server")
        else
            run_map("python main.py", "Run main.py")
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

-- CODE SNAP

vim.keymap.set('x', '<leader>cc', ':CodeSnap<CR>', { desc = "CodeSnap Image saved to clipboard" })
vim.keymap.set('x', '<leader>cs', ':CodeSnapSave<CR>', { desc = "CodeSnap Image saved to pics dir" })

-- TABS MANAGEMENT

vim.keymap.set('n', '<C-T><C-T>', ':tabnew<CR><C-T><C-D><C-W><C-W>', { desc = "open a new tab", remap = true })
vim.keymap.set('i', '<C-T><C-T>', ':tabnew<CR><C-T><C-D><C-W><C-W>', { desc = "open a new tab", remap = true })
for i = 1, 9 do
    vim.keymap.set('n', '<A-' .. i .. '>', '<Cmd>BufferGoto ' .. i .. '<CR>',
        { desc = "open tab " .. i, remap = true, silent = true })
end
vim.keymap.set('n', '<A-0>', '<Cmd>BufferLast<CR>', { desc = "open the last tab", remap = true, silent = true })
vim.keymap.set('n', '<A-->', '<Cmd>BufferMoveNext<CR>', { desc = "move tab forward", remap = true, silent = true })
vim.keymap.set('n', '<A-=>', '<Cmd>BufferMovePrevious<CR>', { desc = "move tab backward", remap = true, silent = true })
vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', { desc = "go to next tab", remap = true, silent = true })
vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', { desc = "go to previous tab", remap = true, silent = true })
vim.keymap.set('n', '<A-x>', '<Cmd>BufferClose<CR>', { desc = "close current tab", remap = true, silent = true })

-- TELESCOPE

vim.keymap.set("n", '<leader>tt', ':Telescope<CR>', { desc = "open telescope", remap = true })
vim.keymap.set("n", '<leader>km', ':Telescope keymaps<CR>', { desc = "open telescope keymaps", remap = true })
vim.keymap.set("n", '<leader>fd', ':Telescope fd<CR>', { desc = "open telescope fd", remap = true })
vim.keymap.set("n", '<leader>cp', ':Telescope commands<CR>', { desc = "open telescope commands", remap = true })
vim.keymap.set("n", '<leader>CS', ':Telescope colorscheme<CR>', { desc = "open telescope colorscheme", remap = true })
vim.keymap.set("n", '<leader>tvo', ':Telescope vim_options<CR>', { desc = "open telescope vim options", remap = true })
vim.keymap.set("n", '<leader>gr', ':Telescope live_grep<CR>', { desc = "open telescope live grep", remap = true })

-- DOCUMENT GENERATION
vim.keymap.set('n', '<Leader>dg', '<Plug>(doge-generate)')

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

-- Calculator keymaps
vim.keymap.set('n', '<leader>cl', function()
    vim.ui.input({ prompt = 'Calculator (Lua expression): ' }, function(expr)
        if not expr or expr == '' then return end
        local ok, result = pcall(function() return load('return ' .. expr)() end)
        if ok then
            vim.notify(expr .. ' = ' .. result, vim.log.levels.INFO, { title = 'Calculator' })
        else
            vim.notify('Error: ' .. result, vim.log.levels.ERROR, { title = 'Calculator' })
        end
    end)
end, { desc = 'Calculator', noremap = true, silent = true })

-- Goto Preview (required lazily so a missing plugin costs a keypress, not startup)
for key, fn in pairs({
    gpd = "goto_preview_definition",
    gpt = "goto_preview_type_definition",
    gpi = "goto_preview_implementation",
    gpD = "goto_preview_declaration",
    gpr = "goto_preview_references",
    gP = "close_all_win",
}) do
    vim.keymap.set("n", key, function() require('goto-preview')[fn]() end,
        { desc = "goto-preview: " .. fn, noremap = true })
end

-- VENN PLUGIN: HJKL draw lines, `f` boxes a visual selection.
local venn_keys = { n = { J = 'j', K = 'k', L = 'l', H = 'h' }, v = { f = '' } }

vim.keymap.set('n', '<leader>v', function()
    local on = not vim.b.venn_enabled
    vim.b.venn_enabled = on or nil
    vim.wo.virtualedit = on and 'all' or vim.go.virtualedit
    for mode, keys in pairs(venn_keys) do
        for key, motion in pairs(keys) do
            if on then
                local prefix = motion ~= '' and ('<C-v>' .. motion) or ''
                vim.keymap.set(mode, key, prefix .. ':VBox<CR>', { buffer = true, noremap = true })
            else
                pcall(vim.keymap.del, mode, key, { buffer = true })
            end
        end
    end
end, { noremap = true, desc = "Toggle venn drawing mode" })
