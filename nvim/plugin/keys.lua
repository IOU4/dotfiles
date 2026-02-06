function Map(mode, l, r, opts)
  opts = opts or {noremap = true, silent = true}
  vim.keymap.set(mode, l, r, opts);
end
local opts = { noremap = true, silent = true }

-- Better window navigation
Map("n", "<C-h>", "<C-w>h", opts)
Map("n", "<C-j>", "<C-w>j", opts)
Map("n", "<C-k>", "<C-w>k", opts)
Map("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
Map("n", "<C-Up>", ":resize -2<CR>", opts)
Map("n", "<C-Down>", ":resize +2<CR>", opts)
Map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
Map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
Map("n", "<S-l>", ":bnext<CR>", opts)
Map("n", "<S-h>", ":bprevious<CR>", opts)
Map("n", "<leader>b", ":bp<bar>sp<bar>bn<bar>bd<CR>", opts)
Map("n", "<leader>tc", ":tabclose<CR>", opts)

-- Move text up and down
Map("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
Map("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)
Map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
Map("v", "<A-j>", ":m .+1<CR>==", opts)
Map("v", "<A-k>", ":m .-2<CR>==", opts)
Map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Press jk fast to exit insert mode
Map("i", "jk", "<ESC>", opts)

-- from luke
Map("v", "p", '"_dP', opts)

-- quit/save with mapleader
Map("n", "<leader>q", ":q<CR>", opts)
Map("n", "<leader>w", ":w<CR>", opts)

-- No search highlight
Map("n", "<ESC>", ":nohlsearch<CR>", opts)

-- Quickfix list navigation
local function open_diagnostics_qf()
  vim.diagnostic.setqflist()
  vim.cmd.copen()
end
Map('n', '<leader>gl', open_diagnostics_qf, opts)
Map("n", "<leader>cn", ":cnext<CR>", opts)
Map("n", "<leader>cp", ":cprevious<CR>", opts)
Map("n", "<leader>cc", ":cclose<CR>", opts)

Map("n", 'gd', '<C-]>', opts)
