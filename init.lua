vim.g.mapleader = " "

-- Load lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local uv = vim.uv or vim.loop

-- Check if lazy.nvim is installed; if not, bootstrap it
if not uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

if vim.g.neovide then
	require("settings.neovide")
end

require("lazy").setup("plugins")

require("settings.keymaps")
require("settings.lsp")
require("settings.opts")
require("settings.plugins")
require("settings.hooks")
