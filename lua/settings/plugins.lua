require('auto-session').setup({
  log_level = 'info',

  pre_save_cmds = {
    function()
      require("nvim-tree.api").tree.close()
    end
  },

  post_restore_cmds = {
    function()
      vim.cmd "NvimTreeFindFile"
    end
  },
})

require("codecompanion").setup({
  opts = {
    log_level = "DEBUG", -- or "TRACE"
  }
})

require('lualine').setup({
  options = {
    theme = "auto",
    section_separators = { right = '', left = '' },
    component_separators = { left = '', right = '' }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_y = {'encoding', 'fileformat', 'filetype'},
    lualine_x = {'progress'},
    lualine_z = {'location'}
  },
})

require("nvim-tree").setup({
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
    git_ignored = false,
  },
})

require("bidi").setup()
