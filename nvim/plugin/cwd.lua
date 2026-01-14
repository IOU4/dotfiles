-- Gemini
local DIRS = { "/home/emad/maestro/*", "/home/emad/dotfiles/nvim" }
local telescope = require('telescope')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local function read_directories()
  local expanded_directories = {}
  for _, dir_pattern in ipairs(DIRS) do
    if dir_pattern:sub(-2) == '/*' then
      local base_path = dir_pattern:sub(1, -3)
      local expanded_base_path = vim.fn.expand(base_path)
      if vim.fn.isdirectory(expanded_base_path) == 1 then
        table.insert(expanded_directories, expanded_base_path)
        local subdirs = vim.fn.glob(expanded_base_path .. '/*/', 1, 1)
        for _, subdir in ipairs(subdirs) do
          table.insert(expanded_directories, subdir:sub(1, -2))
        end
      else
        table.insert(expanded_directories, dir_pattern)
      end
    else
      table.insert(expanded_directories, dir_pattern)
    end
  end
  return expanded_directories
end
local function directory_picker()
  local directories = read_directories()
  if #directories == 0 then
    vim.notify('No directories found in ' .. DIRECTORIES_JSON_PATH, vim.log.levels.WARN)
    return
  end
  pickers.new({}, {
    prompt_title = 'CWD',
    finder = finders.new_table {
      results = directories,
      entry_maker = function(entry)
        return {
          value = entry,
          display = vim.fn.fnamemodify(entry, ':t'),
          ordinal = vim.fn.fnamemodify(entry, ':t'),
        }
      end,
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        if selection then
          local path = vim.fn.expand(selection.value)
          if vim.fn.isdirectory(path) == 1 then
            vim.cmd('cd ' .. vim.fn.fnameescape(path))
            vim.notify('Changed directory to: ' .. path, vim.log.levels.INFO)
          else
            vim.notify('Directory does not exist: ' .. path, vim.log.levels.ERROR)
          end
        end
      end)
      return true
    end,
  }):find()
end

vim.keymap.set('n', '<leader>p', directory_picker, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pn', ":cd ~/.config/nvim<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ps', ":cd ~/maestro/shared<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pb', ":cd ~/maestro/br<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pc', ":cd ~/maestro/camunda<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pi', ":cd ~/maestro/integration<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ph', ":cd ~/maestro/batch<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pe', ":cd ~/maestro/etr<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pz', ":cd ~/maestro/zbus/<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pt', ":cd ~/maestro/template<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pf', ":cd ~/maestro/front<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pl', ":cd ~/maestro/liquibase<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pae', ":cd ~/maestro/etr-api<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>paz', ":cd ~/maestro/zbus-api<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pao', ":cd ~/maestro/operation-api<CR>", { noremap = true, silent = true })
