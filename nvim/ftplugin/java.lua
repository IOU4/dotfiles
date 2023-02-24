local status_ok, jdtls = pcall(require, "jdtls")
if not status_ok then
	return
end

local jdtls_dir = "/home/emadou/.local/share/nvim/mason/packages/jdtls/"
local path_to_debugger =
	"/home/emadou/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-0.44.0.jar"
local workspace_dir = "/home/emadou/.local/jdtls/workspaces/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local config = {
	cmd = {
		"java",
		"-javaagent:/home/emadou/.local/jdtls/lombok.jar",
		"-jar",
		jdtls_dir .. "plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
		"-configuration",
		jdtls_dir .. "config_linux",
		"-data",
		workspace_dir .. project_name,
	},
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
	on_attach = function(client, bufnr)
		require("iou.lang_servers").on_attach(client, bufnr)
		jdtls.setup_dap({ hotcodereplace = "auto" })
		require("jdtls.dap").setup_dap_main_class_configs()
	end,
	lsp_flags = require("iou.lang_servers").lsp_flags,
	capabilities = require("iou.lang_servers").capabilities,

	init_options = {
		bundles = {
			-- debugger
			vim.fn.glob(path_to_debugger, 1),
		},
	},
}
jdtls.start_or_attach(config)
require("jdtls.setup").add_commands()
