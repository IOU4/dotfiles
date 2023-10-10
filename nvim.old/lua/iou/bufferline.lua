local ok, bufferline = pcall(require, 'bufferline')
if not ok then
  vim.notify("bufferline not foud!")
  return
end

bufferline.setup{
  options = {
    diagnostics = 'nvim_lsp'
  }
}
