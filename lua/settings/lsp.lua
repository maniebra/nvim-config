-- Configure nvim-cmp
local cmp = require('cmp')

-- config mason
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls",
        "basedpyright"
    },
    automatic_installation = true,
}

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require('luasnip').expand_or_jumpable() then
                require('luasnip').expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require('luasnip').jumpable(-1) then
                require('luasnip').jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
        { name = 'path' },
    }),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local util = require('lspconfig.util')


-- -- Python
vim.lsp.config("pylsp", {
    settings = {
        pylsp = {
            plugins = {
                rope = { enabled = false },      -- disable built-in basic Rope
                pylsp_rope = { enabled = true }, -- enable the advanced plugin
                rope_rename = { enabled = false },
                jedi_rename = { enabled = false },
                black = { enabled = true },
                isort = { enabled = true },
                ruff = { enabled = true },
                mypy = { enabled = true },
                pycodestyle = { enabled = false },
                flake8 = { enabled = false },
            }
        }
    }
})

-- -- Lua
vim.lsp.config("lua_ls", {
    capabilities = capabilities
})

-- -- TS
vim.lsp.config("ts_ls", {
    capabilities = capabilities,
})

-- -- C/C++
vim.lsp.config("ccls", {
    capabilities = capabilities,
})

-- -- Rust
vim.lsp.config("rust_analyzer", {
    capabilities = capabilities,
})

-- -- Go
vim.lsp.config("gopls", {
    capabilities = capabilities,
})

-- -- Docker
vim.lsp.config("dockerls", {
    capabilities = capabilities,
})

-- -- LaTeX
vim.lsp.config("texlab", {
    capabilities = capabilities,
})

vim.lsp.config("omnisharp", {
    capabilities = capabilities,
})

-- Java
vim.lsp.config("jdtls", {
    capabilities = capabilities,
})

-- Assembly
vim.lsp.config("asm_lsp", {
    cmd = { 'asm-lsp' },
    filetypes = { 'asm', 's', 'S' },
    root_dir = require('lspconfig.util').root_pattern('.git', '.'),
    capabilities = capabilities,
})

vim.lsp.enable({
    "ts_ls",
    "gopls",
    "dockerls",
    "pylsp",
    "lua_ls",
    "ccls",
    "omnisharp",
    "asm_lsp",
    "texlab",
    "jdtls",
    "rust_analyzer"
})
