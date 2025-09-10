return {
	-- {
	--     -- enabled = false,
	--     "folke/tokyonight.nvim",
	--     lazy = false,    -- make sure we load this during startup if it is your main colorscheme
	--     priority = 1000, -- make sure to load this before all the other start plugins
	--     config = function()
	--         vim.cmd([[colorscheme tokyonight]])
	--     end,
	-- },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			--  TODO: figure out if this even works, since it looks
			-- way different than in the pictures
			vim.cmd([[colorscheme catppuccin-macchiato]])

			-- require("catppuccin").setup({
			--     auto_integrations = true,
			-- })
		end,
	},
}
