return {

	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			c = { "cspell", "cpplint" },
			cpp = { "cspell", "cpplint" },
			go = { "golangci-lint" },
			haskell = { "hlint" },
			typescript = { "eslint_d" },
			python = { "ruff", "mypy" },
		}
	end,
}
