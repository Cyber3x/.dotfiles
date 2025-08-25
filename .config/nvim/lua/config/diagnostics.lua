-- Diagnostic configuration
vim.diagnostic.config {
    severity_sort = true,
    virtual_text = {
        prefix = "E",   -- or '' if you just want the text
        source = false, -- dont show source inline
        format = function(diagnostic)
            -- show only the first line of the message inline
            local msg = diagnostic.message:match("[^\n]*")
            return msg
        end,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚', -- Error icon
            [vim.diagnostic.severity.WARN] = '󰀪', -- Warning icon
            [vim.diagnostic.severity.INFO] = '󰋽', -- Info icon
            [vim.diagnostic.severity.HINT] = '󰌶', -- Hint icon
        },
    },
    float = {
        border = "single",
        source = "if_many",
    }
}

-- Keybind to show full diagnostic in a floating window
vim.keymap.set("n", "<leader>d", function()
    vim.diagnostic.open_float(nil, { focus = false })
end, { desc = "Show diagnostic message" })

-- Or show diagnostics on hover automatically
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, { focus = false })
    end,
})
