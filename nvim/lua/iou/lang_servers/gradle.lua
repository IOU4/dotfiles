local lspconfig = require("lspconfig")

local M = function()
	lspconfig.gradle_ls.setup({
		on_attach = require("iou.lang_servers").on_attach,
		lsp_flags = require("iou.lang_servers").lsp_flags,
		filetypes = { "kotlin", "groovy" },
		root_dir = function()
       return vim.fs.dirname(vim.fs.find({ ".settings.gradle", "settings.gradle.kts" }, { upward = true })[1])
		end,
	})
end
return M
