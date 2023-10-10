local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.3
		end
	end,
	open_mapping = [[<c-t>]],
	hide_numbers = true,
	shade_terminals = false,
	start_in_insert = true,
	insert_mappings = false,
	persist_size = false,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "rounded",
	},
})

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", count = 6, hidden = true, direction = "float" })

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true })

-- local node = Terminal:new({ cmd = "node", hidden = true })
--
-- function _NODE_TOGGLE()
-- 	node:toggle()
-- end
--
-- local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
--
-- function _NCDU_TOGGLE()
-- 	ncdu:toggle()
-- end
--
-- local htop = Terminal:new({ cmd = "htop", hidden = true })
--
-- function _HTOP_TOGGLE()
-- 	htop:toggle()
-- end
--
-- local python = Terminal:new({ cmd = "python", hidden = true })
--
-- function _PYTHON_TOGGLE()
-- 	python:toggle()
-- end
