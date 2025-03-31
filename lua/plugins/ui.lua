return {
  -- Dashboard
  { "nvzone/volt" , lazy = true },
  { "nvzone/menu" , lazy = true },
  { "nvzone/minty", cmd = { "Huefy", "Shades" } },
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
  }

}
