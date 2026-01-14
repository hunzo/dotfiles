local g = vim.g

-- Markdown indentation fix
g.markdown_recommended_style = 0

-- Leader key
g.mapleader = " "

-- Disable cursor shape control (DECSCUSR)
vim.opt.guicursor = ""

-- AutoCMD
-- indent setting
vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	callback = function()
		vim.bo.tabstop = 4
		vim.bo.shiftwidth = 4
		vim.bo.softtabstop = 4
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.bo.tabstop = 4
		vim.bo.shiftwidth = 4
		vim.bo.softtabstop = 4
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact" },
	callback = function()
		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
		vim.bo.softtabstop = 2
	end,
})

-- Config Filetypes
-- file types setting
vim.filetype.add({
	pattern = {
		[".*/ansible/.*%.yml"] = "yaml.ansible",
		[".*/playbooks/.*%.yml"] = "yaml.ansible",
		[".*/roles/.*/tasks/.*%.yml"] = "yaml.ansible",
		[".*/handlers/.*%.yml"] = "yaml.ansible",
		[".*/group_vars/.*%.yml"] = "yaml.ansible",
		[".*/host_vars/.*%.yml"] = "yaml.ansible",
	},
})

-- Diagnostic Symbols
local severity = vim.diagnostic.severity

vim.diagnostic.config({
	signs = {
		text = {
			[severity.ERROR] = " ",
			[severity.WARN] = " ",
			[severity.HINT] = "󰠠 ",
			[severity.INFO] = " ",
		},
	},
})
