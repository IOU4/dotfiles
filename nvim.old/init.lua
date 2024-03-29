require("iou.options")
require("iou.keys")
require("iou.lazy")
require("iou.completion")
require("iou.mason")
require("iou.lsp")
require("iou.debugger")
require("iou.pairs")
require("iou.comments")
require("iou.bufferline")
require("iou.lualine")
require("iou.toggelterm")
require("iou.null-ls")
require("iou.telescope")

vim.api.nvim_create_user_command("OpenConfig", function()
	require("telescope.builtin").find_files({
		prompt_title = "Open Config",
		cwd = "~/.config/nvim/",
	})
end, {})
