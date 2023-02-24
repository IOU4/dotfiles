local lspconfig = require("lspconfig")

local M = function()
	lspconfig.clangd.setup({
		on_attach = require("iou.lang_servers").on_attach,
		lsp_flags = require("iou.lang_servers").lsp_flags,
	})
end
return M
