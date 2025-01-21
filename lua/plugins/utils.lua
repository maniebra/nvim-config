return {
  -- Utilities and Productivity
  {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
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
  {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup({})
    end,
  },
  'jose-elias-alvarez/null-ls.nvim', -- For formatters and linters


  -- Project Management
  'ahmedkhalf/project.nvim',

  -- Code Navigation
  'SmiteshP/nvim-navic',

  -- Performance Enhancements
  'lewis6991/impatient.nvim',

}
