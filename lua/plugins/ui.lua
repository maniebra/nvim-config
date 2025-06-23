return {
    -- Dashboard
    { "nvzone/volt",     lazy = true },
    { "nvzone/menu",     lazy = true },
    { "nvzone/minty",    cmd = { "Huefy", "Shades" } },
    { "nvzone/showkeys", cmd = "ShowkeysToggle" },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },
    {
        "zaldih/themery.nvim",
        lazy = false
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    "karb94/neoscroll.nvim",
    "mcookly/bidi.nvim",
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            sidebar_filetypes = {
                -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
                NvimTree = true,
                -- Or, specify the text used for the offset:
                undotree = {
                    text = 'undotree',
                    align = 'center', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
                },
                -- Or, specify the event which the sidebar executes when leaving:
                ['neo-tree'] = { event = 'BufWipeout' },
                -- Or, specify all three
                Outline = { event = 'BufWinLeave', text = 'symbols-outline', align = 'right' },
            },
        },
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        opts = {
            bind = true,
            handler_opts = {
                border = "rounded"
            }
        },
    },
    {
        'AntonVanAssche/music-controls.nvim',
        opts = {
            default_player = 'elisa',
        }
    },
    {
        "goolord/alpha-nvim",
        config = function()
            require("alpha").setup(require("alpha.themes.dashboard").config)
        end,
        event = "VimEnter"
    }
}
