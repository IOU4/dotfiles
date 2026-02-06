vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {"rebelot/kanagawa.nvim", opts = {
    overrides = function(colors)
      return {
        Pmenu = { fg = colors.theme.ui.shade0, bg = colors.theme.ui.bg_p1 },
        PmenuSel = { fg = "", bg = colors.theme.ui.bg_p2 },
        PmenuSbar = { bg = colors.theme.ui.bg_m1 },
        PmenuThumb = { bg = colors.palette.boatYellow2 },
        BlinkCmpMenuBorder = { fg = "", bg = "" },
        NormalFloat = { bg = "" },
        FloatBorder = { bg = "" },
        FloatTitle = { bg = "" },
      }
    end,}
  },
  {"nvim-tree/nvim-tree.lua"},
  {"nvim-neorg/neorg", lazy = false, version = "*", config = true},
  {"nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim"}},
  {"nvim-treesitter/nvim-treesitter", lazy = false, build = ":TSUpdate"},
  {"windwp/nvim-autopairs", event = "InsertEnter", opts = {}},
  {"neovim/nvim-lspconfig"},
  {"saghen/blink.cmp", version = "1.*", opts = {
    completion = { documentation = { auto_show = true, auto_show_delay_ms = 500 }},
    sources = {
      default = {"lsp", "path"}},
    }
  },
  {"mfussenegger/nvim-jdtls"},
  {"mfussenegger/nvim-dap"},
  {"akinsho/toggleterm.nvim"},
  {"lewis6991/gitsigns.nvim"},
  {"kndndrj/nvim-dbee", dependencies = {"MunifTanjim/nui.nvim"}, opts = {}},
  {"tpope/vim-sleuth"}
})
vim.cmd("colorscheme kanagawa-dragon")
