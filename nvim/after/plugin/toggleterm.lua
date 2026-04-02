require("toggleterm").setup {
  open_mapping = [[<C-t>]],
  direction = 'float',
  autochdir = true,
  on_open = function(term)
    vim.opt_local.mouse = "i"
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-u>", "<PageUp>", {})
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-d>", "<PageDown>", {})
  end
}

local gitui = require('toggleterm.terminal').Terminal:new({cmd = "gitui", hidden = true})
function _GITUI_TOGGLE() gitui:toggle() end
Map("n", "<leader>gg", "<cmd>lua _GITUI_TOGGLE()<CR>")
local yazi = require('toggleterm.terminal').Terminal:new({cmd = "yazi", hidden = true})
function _YAZI_TOGGLE() yazi:toggle() end
Map("n", "<leader>y", "<cmd>lua _YAZI_TOGGLE()<CR>")
