local status, null_ls = pcall(require, "null-ls")
if not status then
	vim.notify("null-ls not found")
	return
end

local b = null_ls.builtins

null_ls.setup({
	on_attach = require("iou.lang_servers").on_attach,
	offset_encoding = "utf-8",
	sources = {
		b.formatting.xmllint,
		b.formatting.stylua,
		b.formatting.ktlint,
		b.formatting.yamlfmt,
		b.formatting.fixjson,
	},
})
