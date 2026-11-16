-- sudo pacman -S tree-sitter-cli
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate", -- rebuild parsers on plugin updation.
	lazy = false,
	disabled = false,
	config = function()
		-- Ensure parsers are installed
		require("nvim-treesitter").install({
			"c",
			"cpp",
			"python",
			"javascript",
			"rust",
			"lua",
			"java",
			"markdown",
			"markdown_inline",
		})

		-- disable treesitter parsing for large files.
		require("nvim-treesitter.config").setup({
			disable = function(lang, buf)
				local max_file_size = 100 * 1024 -- 100KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))

				if ok and stats and stats.size > max_file_size then
					return true
				end
			end,
			additional_vim_regex_highlighting = false,
		})

		-- Enable built-in highlighting and indentation for all files
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end,
}
