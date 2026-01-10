return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = { "Trouble" },
	opts = {}, -- ใช้ค่า default ของ trouble
	keys = {
		-- Diagnostics
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Workspace)" },
		{ "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnostics (Buffer)" },

		-- Quickfix/Loclist
		{ "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix (Trouble)" },
		{ "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },

		-- LSP views
		{ "<leader>xr", "<cmd>Trouble lsp_references toggle<cr>", desc = "LSP References (Trouble)" },
		{ "<leader>xd", "<cmd>Trouble lsp_definitions toggle<cr>", desc = "LSP Definitions (Trouble)" },
		{ "<leader>xt", "<cmd>Trouble lsp_type_definitions toggle<cr>", desc = "LSP Type Defs (Trouble)" },
		{ "<leader>xi", "<cmd>Trouble lsp_implementations toggle<cr>", desc = "LSP Implementations (Trouble)" },
	},
}
