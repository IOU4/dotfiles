local lspconfig = require("lspconfig")
lspconfig.volar.setup({
	on_attach = require("iou.lang_servers").on_attach,
	lsp_flags = require("iou.lang_servers").lsp_flags,
	capabilities = require("iou.lang_servers").capabilities,
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
})
