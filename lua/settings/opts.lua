vim.opt.signcolumn = 'yes'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = 'unnamedplus'

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function on_autosession_restore()
    vim.cmd 'NvimTreeFindFile'
end

require("codecompanion").setup({
    opts = {
      log_level = "DEBUG", -- or "TRACE"
    }
  })

require('lualine').setup {
  options = { theme = 'ayu_mirage' },
    sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}

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

vim.api.nvim_create_autocmd('User', {
  pattern = 'AutoSessionRestorePost',
  callback = on_autosession_restore,
})


vim.cmd 'colorscheme tokyonight'
