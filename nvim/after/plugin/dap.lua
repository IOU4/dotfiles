local dap = require('dap')
dap.defaults.fallback.terminal_win_cmd = 'enew'
dap.defaults.fallback.switchbuf  = 'usevisible,usetab,uselast'
dap.defaults.java.auto_continue_if_many_stopped = false

local widgets = require('dap.ui.widgets')
vim.keymap.set('n', '<Leader>dn', function() dap.continue({new = true}) end)
vim.keymap.set('n', '<Leader>dc', function() dap.continue() end)
vim.keymap.set('n', '<leader>dt', function() dap.terminate() end)
vim.keymap.set('n', '<leader>dr', function() dap.restart() end)
vim.keymap.set('n', '<Leader>dj', function() dap.step_over() end)
vim.keymap.set('n', '<Leader>dl', function() dap.step_into() end)
vim.keymap.set('n', '<Leader>dH', function() dap.step_out() end)
vim.keymap.set('n', '<Leader>db', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>dB', function() dap.toggle_breakpoint(vim.fn.input('Breakpoint Condition: '), nil, nil) end)
vim.keymap.set('n', '<Leader>dp', function() dap.toggle_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dR', function() dap.repl.toggle() vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-j>i', true, false, true)) end)
vim.keymap.set('n', '<Leader>df', function() widgets.centered_float(widgets.frames) end)
vim.keymap.set('n', '<Leader>ds', function() widgets.centered_float(widgets.sessions) end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function() widgets.hover() end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function() widgets.preview(nil, {listener={"scopes"}}) end)
