local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	vim.notify("lspconfig not found!")
	return
end
-- gneral mappings
local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true })
end
map("n", "gl", vim.diagnostic.open_float)
map("n", "gk", vim.diagnostic.goto_prev)
map("n", "gj", vim.diagnostic.goto_next)
map("n", "<C-q>", vim.diagnostic.setloclist)

-- config
vim.diagnostic.config({
	virtual_text = false,
	float = {
		style = "minimal",
		border = "rounded",
		-- source = "always",
		header = "",
		prefix = "",
	},
})

-- signs
local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}
for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

-- borders
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = "rounded"
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

require("mason-lspconfig").setup_handlers({
	function(server_name) -- default handler (optional)
		local found, _ = pcall(require, "iou.lang_servers." .. server_name)
		if found then
			require("iou.lang_servers." .. server_name)
		else
			lspconfig[server_name].setup({
				on_attach = require("iou.lang_servers").on_attach,
				flags = require("iou.lang_servers").lsp_flags,
				capabilities = require("iou.lang_servers").capabilities,
			})
		end
	end,
	["jdtls"] = function() end,
})

lspconfig.dartls.setup({
	on_attach = require("iou.lang_servers").on_attach,
	flags = require("iou.lang_servers").lsp_flags,
	capabilities = require("iou.lang_servers").capabilities,
})
