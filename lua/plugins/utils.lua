return {
    -- Utilities and Productivity
    {
        'rmagatti/auto-session',
        lazy = false,
        config = function()
            require('auto-session').setup({
                suppressed_dirs = { "~/", "/" },
                auto_save = true,
                auto_restore = true,
                auto_session_enable_last_session = true,
            })
        end,
    },
    'numToStr/Comment.nvim',
    'windwp/nvim-autopairs',
    'lukas-reineke/indent-blankline.nvim',
    'norcalli/nvim-colorizer.lua',

    'SmiteshP/nvim-navic',
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    { "mistricky/codesnap.nvim", build = "make" },
    {
        "nvim-neorg/neorg",
        lazy = false
    },
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
        dependencies = {
            "nvim-telescope/telescope.nvim",
            -- "ibhagwan/fzf-lua",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            -- configuration goes here
        },
    }
}
