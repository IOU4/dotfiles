vim.pack.add({
  -- deps
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/MunifTanjim/nui.nvim" },

  -- plugins
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/nvim-mini/mini.pairs" },
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
  { src = "https://github.com/mfussenegger/nvim-jdtls" },
  { src = "https://github.com/mfussenegger/nvim-dap" },
  { src = "https://github.com/akinsho/toggleterm.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/kndndrj/nvim-dbee" },
  { src = "https://github.com/tpope/vim-sleuth" },
  { src = "https://github.com/nvim-tree/nvim-tree.lua" },
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim"},
  { src = "https://github.com/j-hui/fidget.nvim"},
  { src = "https://github.com/ThorstenRhau/token" },
  { src = "https://github.com/stevearc/quicker.nvim"}
})

require("mini.pairs").setup() 
require("dbee").setup({})
require("fidget").setup{}
require("quicker").setup()
vim.cmd.colorscheme("token")

require("blink.cmp").setup({ 
  sources = { default = { "lsp", "path" }},
  completion = { menu = { auto_show = false }},
  keymap = { ["<C-space>"] = {"show"} }
})

require("telescope").setup({
  defaults = {
    prompt_prefix = "",
    results_title = false,
    layout_strategy = "vertical",
    theme = "dropdown",
    path_display = {"truncate"},
    preview = false,
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
  },
  pickers = { 
    buffers = { mappings = { n = { ["dd"] = require("telescope.actions").delete_buffer}}},
    live_grep = { preview = true }
  }
})

require('gitsigns').setup({
    sign_priority = 6,
    on_attach = function(bufnr)
        Map('n', '<leader>hr', require('gitsigns').reset_hunk, {buffer = bufnr})
        Map('n', '<leader>hn', require('gitsigns').next_hunk, {buffer = bufnr})
        Map('n', '<leader>hp', require('gitsigns').prev_hunk, {buffer = bufnr})
        Map('n', '<leader>hb', function() require('gitsigns').blame() end, {buffer = bufnr})
    end
})

require("nvim-tree").setup({
  sync_root_with_cwd = true,
  git = { enable = false },
  view = { width = 50 },
  renderer = { group_empty = true, icons = { show = { folder = false, file = false }}}
})

require("toggleterm").setup {
  open_mapping = [[<C-t>]],
  direction = 'float',
  autochdir = true,
  on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-u>", "<PageUp>", {})
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-d>", "<PageDown>", {})
  end
}

