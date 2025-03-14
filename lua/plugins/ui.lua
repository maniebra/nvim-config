return {
  -- Dashboard
  {
    "nvchad/base46",
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  { "nvzone/volt" , lazy = true },
  { "nvzone/menu" , lazy = true },
  { "nvzone/minty", cmd = { "Huefy", "Shades" } },
  { "nvzone/showkeys", cmd = "ShowkeysToggle" },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
  -- Theme and Aesthetic Enhancements
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  "mcookly/bidi.nvim",

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
  }

}
