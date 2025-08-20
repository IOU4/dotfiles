local jdtls = require("jdtls")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local home = os.getenv("HOME")
local workspace_dir = home.."/.local/share/jdtls/workspace/" .. project_name

jdtls.start_or_attach({
  cmd = {
    "jdtls",
    "-data", workspace_dir,
    "--jvm-arg=-javaagent:"..home.."/.local/share/jdtls/lombok.jar",
  },
  root_dir = vim.fs.root(0, {".git", "mvnw", "gradlew"}),
  on_attach = lsp_on_attach, 
  capabilities = require('cmp_nvim_lsp').default_capabilities() ,
  settings = {
    java = {
      eclipse = { downloadSources = true },
      maven = { downloadSources = true, updateSnapshots = true },
      references = { includeDecompiledSources = true },
      format = { enabled = false },
    }
  },
  init_options = {
    workspaceFolders = {
      "file://"..home.."/maestro/br",
      "file://"..home.."/maestro/shared",
      "file://"..home.."/maestro/camunda",
    },
    bundles = { vim.fn.glob(home.."/gits/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", 1) },
  }
})

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.wo.signcolumn = "yes:1"
