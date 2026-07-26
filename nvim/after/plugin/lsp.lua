vim.lsp.enable('ts_ls')
vim.lsp.enable('gopls')

local home = os.getenv("HOME")
vim.lsp.config("jdtls", {
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
      configuration = {
        runtimes = {
          {
            name = "JavaSE-17",
            path = "/usr/lib/jvm/java-17-openjdk/",
            default = true
          },
          {
            name = "JavaSE-21",
            path = "/usr/lib/jvm/java-21-openjdk/",
          },
        },
      },
    },
  },

  init_options = {
    workspaceFolders = (function()
      local project = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
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
  root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),
})
vim.lsp.enable("jdtls")
