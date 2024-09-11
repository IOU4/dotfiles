local telescope = require("telescope")

telescope.setup({
  defaults = {
    sorting_strategy = "ascending",
    prompt_prefix = "",
    prompt_title = false,
    results_title = false,
    selection_caret = "",
    theme = "dropdown",
    preview = false,
    multi_icon = ">",
    layout_config = {
      prompt_position = "top",
      height = 0.60,
      width = 0.60,
    },
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        },
        n = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        },
      },
    },
  }
})

-- diable folds in telescope
vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "TelescopeResults",
    callback = function() vim.opt.foldenable = false end
  }
)

-- keymaps
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n", "<leader>fm", "<cmd>lua require('telescope.builtin').man_pages()<cr>", opts)
