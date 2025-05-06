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
    'jose-elias-alvarez/null-ls.nvim',

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
}
