local options = {
  backup = false,                          -- creates a backup file
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  incsearch = true,                        -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "",                              -- disallow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 500,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 3,                         -- set number column width to 2 {default 4}
  signcolumn = "yes:1",                   -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
  cmdheight = 1,                           -- lines below status line
  laststatus = 3,                          -- shared status line for all windows
  foldmethod = "indent",                   -- indetation based folding
}
for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.shortmess:append("c")
vim.opt.clipboard:append("unnamedplus") -- allows neovim to access the system clipboard
vim.cmd("set whichwrap+=<,>,[,],h,l")

vim.api.nvim_create_autocmd("RecordingEnter", {
  callback = function()
    vim.opt.cmdheight = 1
  end
})
vim.api.nvim_create_autocmd("RecordingLeave", {
  callback = function()
    vim.opt.cmdheight = 0
  end
})

function GetBranchName()
  local res = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null"):read("*a")
  if res == "" then
    return res
  else
    return " " .. res:gsub("[\n\r]", "");
  end
end

function GetCWD()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
end

vim.opt.statusline = "[%{v:lua.GetCWD()}][%{v:lua.GetBranchName()}][%t]%=%q %Y%R %{&fenc} %{&ff} %= %c:%l %p%%"
vim.api.nvim_create_autocmd("DirChanged", {
  callback = function()
    vim.cmd("redrawstatus")
  end,
})
