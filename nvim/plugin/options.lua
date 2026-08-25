vim.opt.undofile = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.completeopt = {"menuone", "noselect"}
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = ""
vim.opt.pumheight = 15
vim.opt.showmode = false
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.timeoutlen = 500
vim.opt.updatetime = 300
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.laststatus = 3
vim.opt.foldenable = false
vim.opt.foldmethod = "indent"
vim.opt.winborder = "single"
vim.opt.fixendofline = false
vim.opt.shortmess:append("c")
vim.opt.clipboard:append("unnamedplus")
vim.opt.whichwrap:append("<,>,[,],h,l")

-- statusline
GET_BRANCH_NAME = function() local b=(io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null"):read("*a") or ""):gsub("%s+$",""); return b~="" and (" "..b) or "" end
GET_CWD = function() return vim.fn.fnamemodify(vim.fn.getcwd(), ':t') end
vim.opt.statusline = " %{v:lua.GET_CWD()}%{v:lua.GET_BRANCH_NAME()}%m%= %f %= %y%R %c:%l %p%% "
vim.api.nvim_set_hl(0, "StatusLine",  { bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLineNC",{ bg = "NONE" })
