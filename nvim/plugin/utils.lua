map = function(mode, l, r, opts)
  opts = opts or {}
end

lsp_on_attach = function(_, bufnr)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover { border = "single", max_height = 25, max_width = 120 } end, {silent = true, buffer = bufnr})
  vim.keymap.set("i", "<C-s>", function() vim.lsp.buf.signature_help { border = "single", max_height = 25, max_width = 120 } end, {silent = true, buffer = bufnr})
end
