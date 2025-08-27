local M = {}

function M.setup()
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "gitcommit",
        callback = function()
            vim.cmd("startinsert")
        end,
    })
end

return M
