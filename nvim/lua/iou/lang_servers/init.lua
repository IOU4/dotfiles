local M = {}

local lsp_formatting = function(bufnr)
	for _, cl in ipairs(vim.lsp.get_active_clients({ bufnr = bufnr })) do
		if cl.name == "null-ls" then
			vim.lsp.buf.format({
				filter = function(client)
					return client.name == "null-ls"
				end,
				timeout_ms = 2000,
			})
			return
		end
	end
	vim.lsp.buf.format()
end
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

M.on_attach = function(client, bufnr)
	local isTelescope, telescope = pcall(require, "telescope.builtin")
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", isTelescope and telescope.lsp_definitions or vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", isTelescope and telescope.lsp_implementations or vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "gt", isTelescope and telescope.lsp_type_definitions or vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "gr", isTelescope and telescope.lsp_references or vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, bufopts)
	vim.keymap.set("n", "<leader>Wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>Wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>Wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)

	-- avoid formatting conflicts
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end
local isCmp, lsp_cmp = pcall(require, "cmp_nvim_lsp")
local capabilities = vim.lsp.protocol.make_client_capabilities()
if isCmp then
	capabilities = lsp_cmp.default_capabilities()
end

M.capabilities = capabilities

M.lsp_flags = {
	debounce_text_changes = 150,
}

return M
