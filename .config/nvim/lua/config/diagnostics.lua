-- Diagnostic configuration
vim.diagnostic.config {
    severity_sort = true,
    virtual_text = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚', -- Error icon
            [vim.diagnostic.severity.WARN] = '󰀪', -- Warning icon
            [vim.diagnostic.severity.INFO] = '󰋽', -- Info icon
            [vim.diagnostic.severity.HINT] = '󰌶', -- Hint icon
        },
    },
}
