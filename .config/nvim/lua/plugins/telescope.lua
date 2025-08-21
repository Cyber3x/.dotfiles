return {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.8',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "folke/which-key.nvim" -- Add dependency to ensure loading order
    },
    config = function()
        local builtin = require("telescope.builtin")

        -- Set up the actual keymaps
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep" })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Buffers" })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help Tags" })

        -- Register the group name with which-key (newer API)
        local wk = require("which-key")
        wk.add({
            { "<leader>f", group = "Find" }
        })
    end,
}
