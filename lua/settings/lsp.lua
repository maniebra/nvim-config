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

-- Applied to every server; no need to repeat it per-config.
vim.lsp.config("*", {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- Python
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

-- Assembly: not shipped by nvim-lspconfig, so it needs a full definition.
vim.lsp.config("asm_lsp", {
    cmd = { 'asm-lsp' },
    filetypes = { 'asm', 's', 'S' },
    root_dir = function(bufnr, on_dir)
        on_dir(vim.fs.root(bufnr, { '.asm-lsp.toml', '.git' }) or vim.fn.getcwd())
    end,
})

-- Servers below use nvim-lspconfig's stock config as-is.

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
