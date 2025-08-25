--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", 
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    {"catppuccin/nvim", name = "catppuccin"},
    {"rebelot/kanagawa.nvim", config = function() vim.cmd("colorscheme kanagawa") end},
    {"nvim-tree/nvim-tree.lua"},
    {"nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim"}},
    {"nvim-treesitter/nvim-treesitter"},
    {"windwp/nvim-autopairs", event = "InsertEnter", opts = {}},
    {"neovim/nvim-lspconfig"},
    {"hrsh7th/nvim-cmp", dependencies = {"hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip"}},
    {"mfussenegger/nvim-jdtls"},
    {"mfussenegger/nvim-dap"},
    {"akinsho/toggleterm.nvim"},
    {"nvim-neorg/neorg", lazy = false, version = "*"},
    {"lewis6991/gitsigns.nvim"},
    {"kndndrj/nvim-dbee", dependencies = {"MunifTanjim/nui.nvim"}, opts = {}},
    {"romgrk/barbar.nvim", init = function() vim.g.barbar_auto_setup = false end, opts = {icons={button=false,filetype ={enabled = false}}, animation=false,clickable=false,}}
  },
  ui = {
    border = "single"
  }
})
