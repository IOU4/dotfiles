local DIRS = { "/home/emad/maestro/*", "/home/emad/dotfiles/nvim" }
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
        local subdirs = vim.fn.glob(expanded_base_path .. '/*/', true, true)
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
local directories = read_directories()
local function directory_picker()
  if #directories == 0 then
    vim.notify('No directories found', vim.log.levels.WARN)
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
    attach_mappings = function(prompt_bufnr, _)
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

Map('n', '<leader>p', directory_picker)
Map('n', '<leader>pm', ":cd ~/maestro<CR>")
Map('n', '<leader>pn', ":cd ~/.config/nvim<CR>")
Map('n', '<leader>ps', ":cd ~/maestro/shared<CR>")
Map('n', '<leader>pb', ":cd ~/maestro/br<CR>")
Map('n', '<leader>pc', ":cd ~/maestro/camunda<CR>")
Map('n', '<leader>pi', ":cd ~/maestro/integration<CR>")
Map('n', '<leader>ph', ":cd ~/maestro/batch<CR>")
Map('n', '<leader>pe', ":cd ~/maestro/etr<CR>")
Map('n', '<leader>pz', ":cd ~/maestro/zbus/<CR>")
Map('n', '<leader>pt', ":cd ~/maestro/template<CR>")
Map('n', '<leader>pf', ":cd ~/maestro/front<CR>")
Map('n', '<leader>pl', ":cd ~/maestro/liquibase<CR>")
Map('n', '<leader>pa', ":cd ~/maestro/auth<CR>")
Map('n', '<leader>pco', ":cd ~/maestro/config<CR>")
Map('n', '<leader>pea', ":cd ~/maestro/etr-api<CR>")
Map('n', '<leader>pza', ":cd ~/maestro/zbus-api<CR>")
Map('n', '<leader>poa', ":cd ~/maestro/operation-api<CR>")
