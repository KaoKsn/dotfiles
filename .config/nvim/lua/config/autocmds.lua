-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight on yanking lines",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }), -- avoid autocmd duplication.
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Remove trailing whitespaces
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Remove trailing whitespace on save",
	group = vim.api.nvim_create_augroup("trim_whitespace", { clear = true }),
	callback = function()
		local save_cursor = vim.fn.winsaveview()
		vim.cmd([[%s/\s\+$//e]]) -- raw strings.
		vim.fn.winrestview(save_cursor) -- restore cursor state.
	end,
})
