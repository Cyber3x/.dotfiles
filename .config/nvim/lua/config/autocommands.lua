local M = {}

function M.setup()
	-- on open git commit editor, start in insert mode to save time
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "gitcommit",
		callback = function()
			vim.cmd("startinsert")
		end,
	})
end

return M
