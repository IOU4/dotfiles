require('kanagawa').setup({
  transparent = true,
  background = {
    dark = "dragon",
    light = "lotus"
  },
  colors = {
    palette = {},
    theme = {
      all = {
        ui = {
          bg_gutter = "none"
        }
      }
    }
  },
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
vim.cmd 'highlight NormalFloat guibg=none'
vim.cmd 'highlight TelescopeBorder guibg=none'
vim.cmd 'highlight TelescopeTitle guibg=none'
