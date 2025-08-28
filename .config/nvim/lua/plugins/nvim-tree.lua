return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local api = require("nvim-tree.api")
        require("nvim-tree").setup {}

        -- Keymap to toggle file tree
        vim.keymap.set("n", "<leader>e", function()
                api.tree.toggle({
                    path = nil,
                    find_file = false,
                    update_root = false,
                    focus = true,
                })
            end,
            { noremap = true, silent = true, desc = "Toggle NvimTree" })
    end,
}
