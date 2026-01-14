local telescope = require("telescope")

telescope.setup({
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

-- keymaps
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n", "<leader>fm", "<cmd>lua require('telescope.builtin').man_pages()<cr>", opts)
