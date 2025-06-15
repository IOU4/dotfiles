require("cd-project").setup({
    projects_picker = "telescope",
})

vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>CdProject<CR>", { noremap = true, silent = true })
