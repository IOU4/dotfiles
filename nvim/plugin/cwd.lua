-- Gemini
local telescope = require('telescope')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local DIRECTORIES_JSON_PATH = vim.fn.expand('~/.config/nvim/cds.json')
local function read_directories()
  local file = io.open(DIRECTORIES_JSON_PATH, 'r')
  if not file then
    vim.notify('Could not open directories file: ' .. DIRECTORIES_JSON_PATH, vim.log.levels.ERROR)
    return {}
  end
  local content = file:read('*a')
  file:close()
  local ok, directories = pcall(vim.json.decode, content)
  if not ok then
    vim.notify('Error parsing JSON file: ' .. DIRECTORIES_JSON_PATH, vim.log.levels.ERROR)
    return {}
  end
  return directories
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
          display = entry.name,
          ordinal = entry.name,
        }
      end,
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        if selection then
          local path = vim.fn.expand(selection.value.path)
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
vim.keymap.set('n', '<leader>p', directory_picker, { desc = 'Change directory with telescope', noremap = true, silent = true })
vim.api.nvim_create_autocmd("DirChanged", {
  callback = function()
    vim.cmd("redrawstatus")
  end,
})
