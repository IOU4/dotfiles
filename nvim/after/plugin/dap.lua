local dap = require('dap')
dap.set_log_level('INFO')
dap.defaults.fallback.terminal_win_cmd = 'enew'
dap.defaults.fallback.switchbuf  = 'usevisible,usetab,uselast'
dap.defaults.java.auto_continue_if_many_stopped = false

dap.listeners.after.event_initialized['go-start-log'] = function()
  vim.notify('DAP session started', vim.log.levels.INFO)
end

dap.adapters.go = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = { 'dap', '-l', '127.0.0.1:${port}' },
  }
}

dap.configurations.go = {
  {
    type = 'go',
    name = 'Debug file',
    request = 'launch',
    program = '${file}',
    console = 'integratedTerminal',
  },
  {
    type = 'go',
    name = 'Debug package',
    request = 'launch',
    program = '${fileDirname}',
    console = 'integratedTerminal',
  },
}
