return {
    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },
    {
        "christoomey/vim-tmux-navigator"
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },
}
