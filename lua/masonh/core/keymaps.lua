vim.g.mapleader = " "

vim.keymap.set("n", "<leader>fcf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>", vim.cmd.WhichKey)

vim.keymap.set("n", "<leader>vs", vim.cmd.vs)
vim.keymap.set("n", "<leader>hs", vim.cmd.split)
