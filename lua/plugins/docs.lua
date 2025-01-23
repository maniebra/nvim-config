return {

  -- Markdown and Writing
  'preservim/vim-markdown',
  'sudormrfbin/cheatsheet.nvim',  -- For cheatsheets  

  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && npm install',
    ft = 'markdown',
  },

}
