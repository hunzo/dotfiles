-- lua/plugins/nvim-lint.lua
return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- mapping filetype -> linter
		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			dockerfile = { "hadolint" },
			python = { "ruff" },
			go = { "golangcilint" }, -- ชื่อที่ถูก (ไม่มีขีดล่าง)
		}

		-- หา project root: go.work -> go.mod -> .git
		local function project_root(bufnr)
			local bufname = vim.api.nvim_buf_get_name(bufnr)
			if not bufname or bufname == "" then
				return nil
			end
			local rootfile = vim.fs.find({ "go.work", "go.mod", ".git" }, { path = bufname, upward = true })[1]
			return rootfile and vim.fs.dirname(rootfile) or nil
		end

		-- เงื่อนไขว่าควร lint ไหม
		local function should_lint(buf)
			if vim.bo[buf].buftype ~= "" then
				return false
			end -- skip help/terminal/neo-tree ฯลฯ
			local ft = vim.bo[buf].filetype
			return lint.linters_by_ft[ft] ~= nil
		end

		local grp = vim.api.nvim_create_augroup("LintOnEvents", { clear = true })
		vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "BufReadPost" }, {
			group = grp,
			callback = function(args)
				if not should_lint(args.buf) then
					return
				end
				local root = project_root(args.buf)
				-- ถ้าเป็น Go ต้องมี root; ภาษาอื่น ๆ จะรันจาก CWD ปัจจุบันได้
				if vim.bo[args.buf].filetype == "go" and not root then
					return
				end
				-- ส่ง cwd ผ่าน opts แทนการแก้ linter definition
				vim.defer_fn(function()
					lint.try_lint(nil, { cwd = root })
				end, 50)
			end,
		})

		-- คีย์ลัดรันเอง โดยส่ง cwd ให้ด้วย
		vim.keymap.set("n", "<leader>l", function()
			local buf = vim.api.nvim_get_current_buf()
			if not should_lint(buf) then
				return
			end
			lint.try_lint(nil, { cwd = project_root(buf) })
		end, { desc = "Trigger linting manually" })
	end,
}
