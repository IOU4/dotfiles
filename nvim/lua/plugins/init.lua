return {
	"nvim-lua/popup.nvim", -- probably popups
	"nvim-lua/plenary.nvim", -- I don't know
	{ "catppuccin/nvim", name = "catppuccin" }, -- colorscheme
	"windwp/nvim-autopairs", -- pairs
	"numToStr/Comment.nvim", -- comments
	"akinsho/bufferline.nvim", -- bufferline
	"nvim-lualine/lualine.nvim", -- status line
	"ahmedkhalf/project.nvim", -- project scope
	"folke/trouble.nvim", -- show code problems
	"mfussenegger/nvim-jdtls", -- java support
	"jose-elias-alvarez/null-ls.nvim", -- formatting
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-nvim-lsp", -- lsp completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"L3MON4D3/LuaSnip", --snippet engine
	"akinsho/toggleterm.nvim",
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
	},
	-- LSP
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	-- Debuggin
	"mfussenegger/nvim-dap",

	-- Telescope
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-ui-select.nvim",

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
}
