return {

  -- Markdown and Writing
  'sudormrfbin/cheatsheet.nvim',  -- For cheatsheets  
  {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  }

}
