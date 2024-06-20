return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        local telescope = require("telescope")
        local builtin = require('telescope.builtin')
        telescope.setup({
            defaults = {
                path_display = { "smart" },
            }
        })

        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

        telescope.load_extension("fzf")
    end
}
