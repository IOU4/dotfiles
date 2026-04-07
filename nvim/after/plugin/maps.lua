-- telescope
Map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
Map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
Map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
Map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
Map("n", "<leader>fm", "<cmd>lua require('telescope.builtin').man_pages()<cr>")

-- dap
Map('n', '<Leader>dn', function() require('dap').continue({new = true}) end)
Map('n', '<Leader>dc', function() require('dap').continue() end)
Map('n', '<leader>dt', function() require('dap').terminate() end)
Map('n', '<leader>dr', function() require('dap').restart() end)
Map('n', '<Leader>dj', function() require('dap').step_over() end)
Map('n', '<Leader>dl', function() require('dap').step_into() end)
Map('n', '<Leader>dH', function() require('dap').step_out() end)
Map('n', '<Leader>db', function() require('dap').toggle_breakpoint() end)
Map('n', '<Leader>dB', function() require('dap').toggle_breakpoint(vim.fn.input('Breakpoint Condition: '), nil, nil) end)
Map('n', '<Leader>dp', function() require('dap').toggle_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
Map('n', '<Leader>dR', function() require('dap').repl.toggle() vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-j>i', true, false, true)) end)
Map('n', '<Leader>df', function() require('dap.ui.widgets').centered_float(require('dap.ui.widgets').frames) end)
Map('n', '<Leader>ds', function() require('dap.ui.widgets').centered_float(require('dap.ui.widgets').sessions) end)
Map({'n', 'v'}, '<Leader>dh', function() require('dap.ui.widgets').hover() end)
Map({'n', 'v'}, '<Leader>dp', function() require('dap.ui.widgets').preview(nil, {listener={"scopes"}}) end)

Map("n", "<leader>gd", "<cmd>Dbee<CR>")
Map("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")

Map("n", "<leader>gg", "<cmd>lua require('toggleterm.terminal').Terminal:new({cmd='gitui',hidden=true}):toggle()<CR>")
