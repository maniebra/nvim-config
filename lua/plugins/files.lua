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
}

