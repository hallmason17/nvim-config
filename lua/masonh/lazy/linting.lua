return {

	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			c = {},
			cpp = { "cpplint" },
			go = { "golangcilint" },
			haskell = { "hlint" },
			python = { "mypy", "ruff" },
			rust = { "clippy" },
			typescript = { "biomejs", "eslint_d" },
			json = { "jsonlint" },
			yaml = { "yamllint" },
			lua = { "luac" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Lint" })
	end,
}
