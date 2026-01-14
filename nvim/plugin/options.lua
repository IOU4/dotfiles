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
vim.opt.writebackup = false
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
vim.opt.cmdheight = 1
vim.opt.laststatus = 3
vim.opt.foldenable = false
vim.opt.foldmethod = "indent"
vim.opt.winborder = "single"
vim.opt.shortmess:append("c")
vim.opt.clipboard:append("unnamedplus")
vim.opt.whichwrap:append("<,>,[,],h,l")

get_branch_name = function() return io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null"):read("*a"):gsub("[\n\r]", "") end
get_cwd = function() return vim.fn.fnamemodify(vim.fn.getcwd(), ':t') end
vim.opt.statusline = "[%{v:lua.get_cwd()} %{v:lua.get_branch_name()}]%m%= [%t] %y%R %= %c:%l %p%%"


function _G.qf_format_enhanced(info)
  local items = vim.fn.getqflist({id = info.id, items = 0}).items
  local lines = {}
  for i = info.start_idx, info.end_idx do
    local item = items[i]
    local filename = ""
    if item.bufnr > 0 then
      filename = vim.api.nvim_buf_get_name(item.bufnr)
    elseif item.filename then
      filename = item.filename
    end
    if filename ~= "" then
      filename = vim.fn.pathshorten(filename, 1)
    else
      filename = "[No file]"
    end
    local line_parts = {filename}
    if item.lnum > 0 then
      local pos = tostring(item.lnum)
      if item.col > 0 then
        pos = pos .. ":" .. item.col
      end
      table.insert(line_parts, pos)
    end
    if item.text and item.text ~= "" then
      local text = vim.trim(item.text)
      table.insert(line_parts, text)
    end
    local formatted_line = table.concat(line_parts, " | ")
    table.insert(lines, formatted_line)
  end
  return lines
end
vim.o.quickfixtextfunc = 'v:lua.qf_format_enhanced'
