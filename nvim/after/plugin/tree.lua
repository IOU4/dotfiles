require("nvim-tree").setup({
  sync_root_with_cwd = true,
  git = {
    enable = false
  },
  view = {
    width = 50,
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        folder = false,
        file = false
      }
    }
  }
})

Map("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")
