vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("RecordingEnter", {
  callback = function() vim.opt.cmdheight = 1 end
})
vim.api.nvim_create_autocmd("RecordingLeave", {
  callback = function() vim.opt.cmdheight = 0 end
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function() vim.wo.signcolumn = vim.bo.modifiable and "yes:1" or "no" end
})

vim.api.nvim_create_autocmd("DirChanged", {
  callback = function() vim.cmd("redrawstatus") end
})

vim.api.nvim_create_autocmd( "FileType", {
    pattern = {"java", "xml", "bash", "lua", "sql"},
    callback = function()
      vim.opt.foldenable = false
      vim.treesitter.start()
      vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo[0][0].foldmethod = 'expr'
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  }
)

vim.api.nvim_create_autocmd( "FileType", {
    pattern = "help",
    callback = function() vim.cmd("wincmd L") end
  }
)
