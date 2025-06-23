-- Configure nvim-cmp
local cmp = require('cmp')

-- config mason
require("mason").setup()
require("mason-lspconfig").setup()

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
require('lspconfig').pyright.setup({
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",  -- or "off" if you want no type checking
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly"
      }
    }
  }
})



-- -- Lua
require('lspconfig')['lua_ls'].setup {
  capabilities = capabilities
}

-- -- TS
require('lspconfig')['ts_ls'].setup {
  capabilities = capabilities,
}

-- -- C/C++
require('lspconfig')['ccls'].setup {
  capabilities = capabilities,
}

-- -- Rust
require('lspconfig')['rust_analyzer'].setup {
  capabilities = capabilities,
}

-- -- Go
require('lspconfig')['gopls'].setup {
  capabilities = capabilities,
}

-- -- Docker
require('lspconfig')['dockerls'].setup {
  capabilities = capabilities,
}

-- -- LaTeX
require('lspconfig')['texlab'].setup {
  capabilities = capabilities,
}

require('lspconfig')['omnisharp'].setup {
  capabilities = capabilities,
}

-- Java
require('lspconfig')['jdtls'].setup {
  capabilities = capabilities,
}

-- Assembly
require('lspconfig')['asm_lsp'].setup {
  cmd = { 'asm-lsp' },
  filetypes = { 'asm', 's', 'S' },
  root_dir = require('lspconfig.util').root_pattern('.git', '.'),
  capabilities = capabilities,
}
