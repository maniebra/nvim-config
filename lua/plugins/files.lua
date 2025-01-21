return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },


  -- File Explorer and UI Enhancements
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'akinsho/bufferline.nvim',

  -- Telescope (Advanced Searching)
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
   'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  -- Enhanced Quickfix and Search
  'kevinhwang91/nvim-bqf',
}

