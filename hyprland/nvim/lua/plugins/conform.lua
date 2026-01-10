return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				css = { "prettierd" },
				json = { "prettierd" },
				markdown = { "prettierd" },
				yaml = { "yamlfmt" },
				lua = { "stylua" },
				python = { "autopep8" },
				htmldjango = { "djlint" },
				html = { "djlint" },
				go = { "gofumpt", "golines", "goimports-reviser" },
				sql = { "sqlfmt" },
				sh = { "shfmt" },
				nginx = { "nginxfmt" },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			async = false,
			timeout_ms = 500,
			notify_on_error = true,
			log_level = vim.log.levels.DEBUG,
		})

		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in vitual mode)" })
	end,
}
