vim.lsp.enable('ts_ls')
vim.lsp.enable('lua_ls')

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true)
      },
      runtime = {
        version = 'LuaJIT'
      }
    }
  }
})
