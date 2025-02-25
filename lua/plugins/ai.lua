return {
    "olimorris/codecompanion.nvim",
    {
        "monkoose/neocodeium",
	event = "VeryLazy",
	config = function()
	    local neocodeium = require("neocodeium")
            neocodeium.setup()
            vim.keymap.set("i", "<A-f>", neocodeium.accept)
	end,
    },
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
        })
    end

}
