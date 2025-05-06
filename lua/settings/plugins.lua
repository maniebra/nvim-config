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

require('lualine').setup({
    options = {
        theme = "auto",
        section_separators = { right = '', left = '' },
        component_separators = { left = '', right = '' }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_y = { 'encoding', 'fileformat', 'filetype' },
        lualine_x = { 'progress' },
        lualine_z = { 'location' }
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

require("noice").setup({
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
    },
    presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
    },
})

require("themery").setup({
    themes = {
        "tokyonight",
        "kanagawa",
        "rose-pine",
        "catppuccin",
        "nightfox",
        "cyberdream",
    },
    theme = "tokyonight",
    livePreview = true,
})

require("todo-comments").setup()

require("codesnap").setup({
    save_path = "~/Pictures/CodeSnaps/",
    has_breadcrumbs = true,
    has_line_numbers = true,
    bg_theme = "grape",
    min_width = 32,
    bg_padding = 0,
    watermark_font_family = "Inter",
    watermark = "https://github.com/maniebra",
})

require("neorg").setup()


local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black
    },
})
