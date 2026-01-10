return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			-- list of servers for mason to install
			ensure_installed = {
				-- LSP Servers
				"tailwindcss",
				"ts_ls",
				"gopls",
				-- "pyright@1.1.377",
				"pyright",
				"emmet_ls",
				"html",
				"lua_ls",
				"yamlls",
				"dockerls",
				"bashls",
				"jsonls",
				"cssls",
				"ansiblels",
				"docker_compose_language_service",
				"terraformls",
			},
		},
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},
			"neovim/nvim-lspconfig",
		},
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				-- Formatters
				"autopep8",
				"prettierd",
				"stylua",
				"gofumpt",
				"golines",
				"sqlfmt",
				"yamlfmt",
				"shfmt",
				"nginx-config-formatter",
				"goimports-reviser",
				"terraform",

				-- Linters
				"ruff",
				"eslint_d",
				"djlint",
				"golangci-lint",
				"ansible-lint",
				"hadolint",
				"hadolint",
			},
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
