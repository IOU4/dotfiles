local toggelterm = require("toggleterm")

toggelterm.setup {
  size = 60,
  open_mapping = [[<C-t>]],
  direction = 'float',
  autochdir = true
}

local Terminal = require('toggleterm.terminal').Terminal
local gitui = Terminal:new({cmd = "gitui", hidden = true, direction = 'float'})
local ai = Terminal:new({
  cmd = "opencode",
  hidden = false,
  direction = 'float',
  on_open = function(term) vim.opt_local.mouse = "i" end,
})                                                                                                                                                                                                                 

function _gitui_toggle() gitui:toggle() end
function _ai_toggle() ai:toggle() end

-- keymap("n", "<C-t>", ":60 vsplit term://$SHELL<CR> :startinsert<CR>", opts)
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
keymap("t", "<S-j><S-k>", "<C-\\><C-N>", opts)
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", opts)

keymap("n", "<leader>gg", "<cmd>lua _gitui_toggle()<CR>", opts)
keymap("n", "<leader>gd", "<cmd>Dbee<CR>", opts)
keymap("n", "<leader>ga", "<cmd>lua _ai_toggle()<CR>", opts)
