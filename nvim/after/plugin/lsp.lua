local function open_diagnostics_qf() vim.diagnostic.setqflist(); vim.cmd.copen() end
-- global keymaps
vim.keymap.set("n", "<leader>gl", vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gk", vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gj", vim.diagnostic.goto_next, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gl', open_diagnostics_qf, { noremap = true, silent = true })

vim.lsp.enable('ts_ls')
vim.lsp.enable('bashls')
