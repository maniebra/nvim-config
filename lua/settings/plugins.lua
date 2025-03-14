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

require("noice").setup({
lsp = {
  -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
  override = {
    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
    ["vim.lsp.util.stylize_markdown"] = true,
    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
  },
},
-- you can enable a preset for easier configuration
presets = {
  bottom_search = true, -- use a classic bottom cmdline for search
  command_palette = true, -- position the cmdline and popupmenu together
  long_message_to_split = true, -- long messages will be sent to a split
  inc_rename = false, -- enables an input dialog for inc-rename.nvim
  lsp_doc_border = false, -- add a border to hover docs and signature help
},
})
