-- Rebuild LaTeX on save, but only where a Makefile actually exists.
-- Async: `!make` froze the editor for the length of the build.
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.tex",
    callback = function(args)
        local root = vim.fs.root(args.buf, "Makefile")
        if not root then return end
        vim.system({ "make", "-C", root }, {}, function(out)
            vim.schedule(function()
                if out.code == 0 then
                    vim.notify("make: ok")
                else
                    vim.notify("make failed:\n" .. (out.stderr or ""), vim.log.levels.ERROR)
                end
            end)
        end)
    end,
})
