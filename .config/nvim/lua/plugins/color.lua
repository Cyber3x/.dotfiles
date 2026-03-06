return {
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	priority = 1000,
	-- 	lazy = false,
	-- 	config = function(_, opts)
	-- 		require("tokyonight").setup(opts)
	-- 		vim.cmd("colorscheme tokyonight-night")
	-- 	end,
	-- },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "frappe",
			integrations = {
				lualine = true,
				nvimtree = true,
				cmp = true,
				telescope = true,
				which_key = true,
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
