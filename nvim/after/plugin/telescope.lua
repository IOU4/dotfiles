require("telescope").setup({
  defaults = {
    prompt_prefix = "",
    results_title = false,
    layout_strategy = 'vertical',
    theme = "dropdown",
    multi_icon = ">",
    path_display = {"truncate"},
    preview = false,
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
  },
  pickers = {
    buffers = {
      mappings = {
        n = {
          ["dd"] = require("telescope.actions").delete_buffer,
        },
      },
    },
    live_grep = {
      preview = true
    }
  }
})

Map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
Map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
Map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
Map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
Map("n", "<leader>fm", "<cmd>lua require('telescope.builtin').man_pages()<cr>")
