local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)
map("n", "<leader>b", ":bp<bar>sp<bar>bn<bar>bd<CR>", opts)
map("n", "<leader>tc", ":tabclose<CR>", opts)

-- Move text up and down
map("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
map("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
map("v", "<A-j>", ":m .+1<CR>==", opts)
map("v", "<A-k>", ":m .-2<CR>==", opts)
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Press jk fast to exit insert mode
map("i", "jk", "<ESC>", opts)

-- from luke
map("v", "p", '"_dP', opts)

-- quit/save with mapleader
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>w", ":w<CR>", opts)

-- No search highlight
map("n", "<ESC>", ":nohlsearch<CR>", opts)


-- Quickfix list navigation
map("n", "<leader>cn", ":cnext<CR>", opts)
map("n", "<leader>cp", ":cprevious<CR>", opts)
map("n", "<leader>cc", ":cclose<CR>", opts)
