require('kanagawa').setup({
  transparent = true,
  background = {
    dark = "wave",
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
vim.cmd 'highlight FloatBorder guibg=none'
vim.cmd 'highlight FloatTitle guibg=none'
vim.cmd 'highlight TelescopeBorder guibg=none'
