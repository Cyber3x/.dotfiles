return {
	{
		"folke/trouble.nvim",
		opts = {
			use_diagnostics_signs = true,
		}, -- for default options, refer to the configuration section for custom setup.

		config = function()
			require("trouble").setup({
				-- Position
				position = "bottom", -- "bottom", "top", "left", "right"
				height = 10,
				width = 50,
			})

			-- Open on startup
			vim.cmd("Trouble diagnostics")
		end,
		cmd = "Trouble",
		keys = {
			{
				"<leader>txd",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>txf",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>txs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>txl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>txL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>txq",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
