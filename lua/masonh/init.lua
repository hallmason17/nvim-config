require("masonh.core")
require("masonh.lazy_init")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local ThePrimeagenGroup = augroup("ThePrimeagen", {})

function R(name)
	require("plenary.reload").reload_module(name)
end

autocmd({ "BufWritePre" }, {
	group = ThePrimeagenGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

autocmd("LspAttach", {
	group = ThePrimeagenGroup,
	callback = function(e)
		local opts = { buffer = e.buf }
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts, { desc = "Goto Definition" })
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts, { desc = "Show Hover" })
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts, { desc = "Workspace Symbols" })
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts, { desc = "Open Diagnostics" })
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts, { desc = "Code Action" })
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, opts, { desc = "References" })
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts, { desc = "Rename" })
		vim.keymap.set("i", "<C-o>", function()
			vim.lsp.buf.signature_help()
		end, opts, { desc = "Signature Help" })
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, opts, { desc = "Next Diagnostic" })
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, opts, { desc = "Previous Diagnostic" })
	end,
})
