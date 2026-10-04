return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },

    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',
    'akinsho/bufferline.nvim',

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
    },
    'kevinhwang91/nvim-bqf',
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
                -- "lsp" method calls deprecated vim.lsp.buf_get_clients()
                detection_methods = { "pattern" },
            }
        end
    }
}
