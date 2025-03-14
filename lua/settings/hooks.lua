vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.tex",
  callback = function()
    vim.cmd("silent !make")
    print("Make command executed after saving LaTeX file.")
  end,
})
