local toggelterm = require("toggleterm")

toggelterm.setup {
  size = 60,
  open_mapping = [[<C-t>]],
  direction = 'float',
  autochdir = true
}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = 'float',
})

function _lazygit_toggle()
  lazygit:toggle()
end

-- Better terminal navigation
-- keymap("n", "<C-t>", ":60 vsplit term://$SHELL<CR> :startinsert<CR>", opts)
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("t", "<S-j><S-k>", "<C-\\><C-N>", opts)
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", opts)

keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", opts)
keymap("t", "<C-d>", "<cmd>lua _lazygit_toggle()<CR>", opts)
