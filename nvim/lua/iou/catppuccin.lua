local status, catppuccin = pcall(require, "catppuccin")
if not status then
	vim.notify("catppuccin no found!")
	vim.cmd([[ colorscheme desert ]])
	return
end

catppuccin.setup({
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
})

vim.cmd.colorscheme("catppuccin")

-- please don't edit below this line (use 'toggle-dark' to change color)
vim.o.background = "dark"
