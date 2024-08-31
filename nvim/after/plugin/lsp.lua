-- global keymaps
vim.keymap.set("n", "<leader>gl", vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gk", vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gj", vim.diagnostic.goto_next, { noremap = true, silent = true })

-- config
vim.diagnostic.config({
  virtual_text = false,
  float = {
    style = "minimal",
    border = "single",
    header = "",
    prefix = "",
  },
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = "single", }
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = "single", }
)
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(ev) vim.lsp.buf.format() end,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(_, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "<leader>ci", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<leader>cs", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<leader>ct", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, bufopts)
end

require 'lspconfig'.lua_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      },
      runtime = {
        version = "LuaJIT"
      }
    }
  }
}
require 'lspconfig'.gopls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
