local function open_diagnostics_qf() vim.diagnostic.setqflist(); vim.cmd.copen() end
-- global keymaps
vim.keymap.set("n", "<leader>gl", vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gk", vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gj", vim.diagnostic.goto_next, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gl', open_diagnostics_qf, { noremap = true, silent = true })

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

require'lspconfig'.ts_ls.setup{
    on_attach = lsp_on_attach, 
    capabilities = require('cmp_nvim_lsp').default_capabilities() 
}

