local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/home/emad/.cache/jdtls/workspace/' .. project_name
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(_, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<leader>gr", "<cmd>:Telescope lsp_references<cr>", bufopts)
  vim.keymap.set("n", "<leader>cs", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<leader>ct", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, bufopts)
end

require('jdtls').start_or_attach({
    cmd = {
        'jdtls',
        '-data', workspace_dir,
        "--jvm-arg=-javaagent:/home/emad/.cache/jdtls/lombok.jar",
    },
    root_dir = vim.fs.root(0, {".git", "mvnw", "gradlew"}),
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        java = {
            format = {
                enabled = false,
                settings = { 
                    profile = "intellij",
                    url = "/home/emad/.cache/jdtls/settings.xml"
                },
            }
        }
    }
})
