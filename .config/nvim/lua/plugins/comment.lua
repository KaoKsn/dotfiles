return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("Comment").setup({
			padding = true, --- Add a space b/w comment and the line
			sticky = true, --- Cursor must stay in the position.
			ignore = nil, ---Lines to be ignored while (un)comment
			---LHS of toggle mappings in NORMAL mode
			toggler = {
				---Line-comment toggle keymap
				line = "<leader>cc",
				---Block-comment toggle keymap
				block = "<leader>bc",
			},
			---LHS of operator-pending mappings in NORMAL and VISUAL mode
			opleader = {
				---Line-comment keymap
				line = "<leader>c",
				---Block-comment keymap
				block = "<leader>b",
			},
			---LHS of extra mappings
			extra = {
				above = "gcO", ---Add comment on the line above
				below = "gco", ---Add comment on the line below
				eol = "gcA", ---Add comment at the end of line
			},
			mappings = {
				basic = true,
				extra = true,
			},
		})
	end,
}
