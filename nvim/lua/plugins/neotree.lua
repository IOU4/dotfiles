return {
	"nvim-neo-tree/neo-tree.nvim",
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	opts = {
		popup_border_style = "rounded",
		default_component_configs = {
			icon = {
				folder_closed = "󰉋",
				folder_open = "󰝰",
				folder_empty = "󰉘",
			},
		},
		filesystem = {
			hijack_netrw_behavior = "open_default",
		},
	},
}
