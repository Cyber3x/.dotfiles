return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"folke/which-key.nvim", -- Add dependency to ensure loading order
	},
	config = function()
		local builtin = require("telescope.builtin")
		local wk = require("which-key")

		local prefix = "<leader>s"

		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, prefix .. keys, func, { desc = desc })
		end

		-- Set up the actual keymaps
		map("h", builtin.help_tags, "[S]earch [H]elps")
		map("k", builtin.keymaps, "[S]earch [K]eymaps")
		map("f", builtin.find_files, "[S]earch [F]iles")
		map("g", builtin.git_files, "[S]earch [G]it files")
		map("l", builtin.live_grep, "[S]earch by [L]ive grep")
		map("s", builtin.builtin, "[S]earch [S]elect telescope")
		map("w", builtin.grep_string, "[S]earch current [W]ord")
		map("d", builtin.diagnostics, "[S]earch [D]iagnostics")
		map("r", builtin.resume, "[S]earch [R]esume")
		map(".", builtin.oldfiles, '[S]earch Recent Files ("." for repeat)')

		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

		wk.add({
			{ prefix, group = "[S]earch" },
		})
	end,
}
