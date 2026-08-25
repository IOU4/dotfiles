vim.lsp.enable('ts_ls')
vim.lsp.enable('gopls')

vim.lsp.config('pylsp', {cmd = {'uv', 'run', 'pylsp'}})
vim.lsp.enable('pylsp')
