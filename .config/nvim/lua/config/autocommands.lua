local M = {}

function M.setup()
	-- on open git commit editor, start in insert mode to save time
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "gitcommit",
		callback = function()
			vim.cmd("startinsert")
		end,
	})

	vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
		command = "if mode() != 'c' | checktime | endif",
		pattern = { "*" },
	})
end

return M
