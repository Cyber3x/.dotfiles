return {
    {
        "folke/trouble.nvim",
        opts = {
            use_diagnostics_signs = true,
        }, -- for default options, refer to the configuration section for custom setup.

        config = function()
            require("trouble").setup({
                -- Auto open trouble when there are diagnostics
                auto_open = true,
                auto_close = false,

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
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    }
}
