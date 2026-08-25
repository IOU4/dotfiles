Map('n', '<leader>pm', ":cd ~/maestro<CR>")
Map('n', '<leader>pn', ":cd ~/.config/nvim<CR>")
Map('n', '<leader>ps', ":cd ~/maestro/shared<CR>")
Map('n', '<leader>pb', ":cd ~/maestro/br<CR>")
Map('n', '<leader>pbr', ":cd ~/maestro/br<CR>")
Map('n', '<leader>pc', ":cd ~/maestro/camunda<CR>")
Map('n', '<leader>pca', ":cd ~/maestro/camunda<CR>")
Map('n', '<leader>pi', ":cd ~/maestro/integration<CR>")
Map('n', '<leader>pba', ":cd ~/maestro/batch<CR>")
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

local home = os.getenv("HOME")
local project = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local config = {
  root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),
  cmd = {
    "env", "JAVA_HOME=/usr/lib/jvm/java-21-openjdk",
    "jdtls",
    "--jvm-arg=-javaagent:"..home.."/.local/share/jdtls/lombok.jar",
  },
  settings = {
    java = {
      maven = {
        downloadSources = true,
        updateSnapshots = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      format = {
        enabled = false,
      },
    },
  },
  init_options = {
    workspaceFolders = (function()
      local folders = {}
      if project:match("br") then
        table.insert(folders, "file://" .. home .. "/maestro/shared")
        table.insert(folders, "file://" .. home .. "/maestro/br")
      elseif project:match("shared") then
        table.insert(folders, "file://" .. home .. "/maestro/shared")
        table.insert(folders, "file://" .. home .. "/maestro/br")
        table.insert(folders, "file://" .. home .. "/maestro/etr")
      end
      return folders
    end)(),
  },
}
if project:match("batch") then
  config.on_attach = function(client, bufnr)
  local jdtls = require("jdtls")
  jdtls.setup_dap({ hotcodereplace = "auto" })
  require("jdtls.dap").setup_dap_main_class_configs({
    config_overrides = { args = "UPDATE_RAD" },
  })
  end
end

vim.lsp.config("jdtls", config)
vim.lsp.enable("jdtls")
