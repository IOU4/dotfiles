return {
	"catppuccin/nvim",
	name = "catppuccin",
	opts = {
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		background = { light = "latte", dark = "mocha" },
		transparent_background = true,
		term_colors = true,
		styles = {
			comments = { "italic" },
			properties = { "italic" },
			functions = { "italic", "bold" },
			keywords = { "italic" },
			operators = { "bold" },
			conditionals = { "bold" },
			loops = { "bold" },
			booleans = { "bold", "italic" },
		},
		integrations = {
			treesitter = true,
			native_lsp = { enabled = true },
			lsp_trouble = true,
			telescope = true,
			nvimtree = true,
			mason = true,
			cmp = true,
		},
		custom_highlights = function(colors)
			return {
				Folded = { fg = colors.surface2, bg = colors.base },
			}
		end,
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
