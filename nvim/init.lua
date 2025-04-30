local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    "akinsho/bufferline.nvim",
  },
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "nvim-tree/nvim-tree.lua",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" }
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
  },
  {
    "akinsho/toggleterm.nvim",
  },
  {
    "nvim-neorg/neorg",
    lazy = false,
    version = "*",
  },
  {"mfussenegger/nvim-jdtls"},
  {"lewis6991/gitsigns.nvim"},
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
  },
})
