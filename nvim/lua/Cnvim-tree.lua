vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup({
  renderer = {
    icons = {
      show = {
        folder = false,
        file = false
      }
    }
  }
})

-- NvimTree Navigation
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
