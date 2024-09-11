local toggelterm = require("toggleterm")

toggelterm.setup {
  size = 60,
  open_mapping = [[<C-t>]],
  direction = 'vertical'
}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = 'float',
  display_name = 'lazygit'
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
