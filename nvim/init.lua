--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
Map = vim.keymap.set;

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {"rebelot/kanagawa.nvim", config = function() vim.cmd("colorscheme kanagawa-dragon") end},
  {"nvim-tree/nvim-tree.lua"},
  {"nvim-neorg/neorg", lazy = false, version = "*", config = true},
  {"nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim"}},
  {"nvim-treesitter/nvim-treesitter", lazy = false, build = ":TSUpdate"},
  {"windwp/nvim-autopairs", event = "InsertEnter", opts = {}},
  {"neovim/nvim-lspconfig"},
  {"saghen/blink.cmp", version = "1.*", opts = { sources = { default = { "lsp", "path"}}, cmdline = {}}},
  {"mfussenegger/nvim-jdtls"},
  {"mfussenegger/nvim-dap"},
  {"akinsho/toggleterm.nvim"},
  {"lewis6991/gitsigns.nvim"},
  {"kndndrj/nvim-dbee", dependencies = {"MunifTanjim/nui.nvim"}, opts = {}},
  {"tpope/vim-sleuth"}
})
