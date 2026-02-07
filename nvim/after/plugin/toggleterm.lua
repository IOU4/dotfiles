local toggelterm = require("toggleterm")

toggelterm.setup {
  size = 60,
  open_mapping = [[<C-t>]],
  direction = 'float',
  autochdir = true,
  on_open = function(term)
    vim.opt_local.mouse = "i"
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-u>", "<PageUp>", {})
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-d>", "<PageDown>", {})
  end
}

local Terminal = require('toggleterm.terminal').Terminal
local gitui = Terminal:new({cmd = "gitui", hidden = true, direction = 'float'})
local ai = Terminal:new({
  cmd = "opencode -c",
  hidden = false,
  direction = 'float',
})

function _GITUI_TOGGLE() gitui:toggle() end
function _AI_TOGGLE() ai:toggle() end

-- Map("n", "<C-t>", ":60 vsplit term://$SHELL<CR> :startinsert<CR>", opts)
Map("t", "<S-j><S-k>", "<C-\\><C-N>")
Map("t", "<C-h>", "<C-\\><C-N><C-w>h")
Map("t", "<C-j>", "<C-\\><C-N><C-w>j")
Map("t", "<C-k>", "<C-\\><C-N><C-w>k")
Map("t", "<C-l>", "<C-\\><C-N><C-w>l")
Map("n", "<leader>gg", "<cmd>lua _GITUI_TOGGLE()<CR>")
Map("n", "<leader>gd", "<cmd>Dbee<CR>")
Map("n", "<leader>ga", "<cmd>lua _AI_TOGGLE()<CR>")
