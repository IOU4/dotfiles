local status, telescope = pcall(require, "telescope")
if not status then
	vim.notify("telescope not found !")
	return
end

telescope.setup({
	defaults = {
		prompt_prefix = "",
		selection_caret = "",
		multi_icon = " ",
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",
		},
	},
	pickers = {
		buffers = {
			sort_lastused = true,
			theme = "dropdown",
			previewer = false,
			mappings = {
				i = {
					["<c-d>"] = require("telescope.actions").delete_buffer,
				},
				n = {
					["<c-d>"] = require("telescope.actions").delete_buffer,
				},
			},
		},
		find_files = {
			theme = "dropdown",
			previewer = false,
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
keymap("n", "<leader>fp", "<cmd>lua require('telescope.builtin').find_files({previewer = true})<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n", "<leader>fm", "<cmd>lua require('telescope.builtin').man_pages()<cr>", opts)
