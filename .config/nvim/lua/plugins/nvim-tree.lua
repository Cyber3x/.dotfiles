return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local api = require("nvim-tree.api")
        require("nvim-tree").setup {
            -- Automatically expand the tree to the current file
            update_focused_file = {
                enable = true,     -- enable updating the tree
                update_cwd = true, -- optional: also update working directory
            },
            view = {
                side = "right",
                width = 50,
            }
        }

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
        -- Make <C-Right> and <C-Left> resize the tree
        vim.keymap.set("n", "<C-Right>", ":vertical resize +5<CR>", { silent = true })
        vim.keymap.set("n", "<C-Left>", ":vertical resize -5<CR>", { silent = true })
    end,
}
