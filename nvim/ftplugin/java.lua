local jdtls = require("jdtls")
local project = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local home = os.getenv("HOME")
local workspace_dir = home.."/.local/share/jdtls/workspace/" .. project
local workspace_folders = {}

if string.match(project, "br") or string.match(project, "shared") then
  table.insert(workspace_folders, "file://" .. home .. "/maestro/shared")
  table.insert(workspace_folders, "file://" .. home .. "/maestro/br")
  -- table.insert(workspace_folders, "file://" .. home .. "/maestro/etr-api/model")
  -- table.insert(workspace_folders, "file://" .. home .. "/maestro/etr-api/client")
  -- table.insert(workspace_folders, "file://" .. home .. "/maestro/zbus-api/model")
  -- table.insert(workspace_folders, "file://" .. home .. "/maestro/zbus-api/client")
end

jdtls.start_or_attach({
  cmd = {
    "env", "JAVA_HOME=/usr/lib/jvm/java-21-openjdk",
    "jdtls",
    "-data", workspace_dir,
    "--jvm-arg=-javaagent:"..home.."/.local/share/jdtls/lombok.jar",
  },
  root_dir = vim.fs.root(0, {".git", "mvnw", "gradlew"}),
  settings = {
    java = {
      maven = { downloadSources = true, updateSnapshots = true },
      references = { includeDecompiledSources = true },
      format = { enabled = false },
      configuration = {
        runtimes = {
          {
            name = "JavaSE-17",
            path = "/usr/lib/jvm/java-17-openjdk/",
          },
          {
            name = "JavaSE-21",
            path = "/usr/lib/jvm/java-21-openjdk/",
            default = true,
          },
        },
      },
    }
  },
  init_options = {
    workspaceFolders = workspace_folders,
    bundles = { vim.fn.glob(home.."/.local/share/jdtls/java.debug.jar", 1) },
  }
})

-- vim.bo.shiftwidth = 4
-- vim.bo.tabstop = 4
vim.wo.signcolumn = "yes:1"
