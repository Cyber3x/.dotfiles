return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			delay = 200,

			spec = {
				{ "<leader>s", group = "[S]earch" },
				{ "<leader>t", group = "[T]oggle" },
				-- { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
				{ "gr", group = "[R]efactor" },
				{ "<leader>tx", group = "Trouble" },
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
