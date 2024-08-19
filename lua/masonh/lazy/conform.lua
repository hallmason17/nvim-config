return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				go = { "gofumpt", "goimports" },
				lua = { "stylua" },
				c = { "clang-format", "clangd" },
				python = { "black" },
				elixir = { "mix" },
				haskell = { "ormolu" },
				rust = { "rust-analyzer" },
				typescript = { "prettierd" },
				ocaml = { "ocamlformat " },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})
	end,
}
