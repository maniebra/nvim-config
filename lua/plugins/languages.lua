return {
    -- LSP and Language Server Configuration
    'neovim/nvim-lspconfig',
    {
        'williamboman/mason.nvim',
        build = ':MasonUpdate', -- Auto-update language servers
    },
    'williamboman/mason-lspconfig.nvim',

    -- Autocompletion and Snippets
    'hrsh7th/nvim-cmp',
    'VonHeikemen/lsp-zero.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'nvimdev/lspsaga.nvim',

    -- Debugging and DAP
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',

    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
          "williamboman/mason.nvim",
          "nvimtools/none-ls.nvim",
        }
    }
}
