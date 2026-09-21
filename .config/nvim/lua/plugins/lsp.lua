return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd", -- C/C++
					"bashls", -- Bash
					"lua_ls", -- Lua
					"pyright", -- Python
					"jdtls", -- Java
					"ts_ls", -- JavaScript / TypeScript
					"rust_analyzer", -- Rust
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			-- 1. Global fallback or default options for all servers if needed
			vim.lsp.config("*", {
				root_markers = { ".git" },
			})

			-- 2. Specific overrides (e.g., Lua global `vim` warning fix)
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			-- 3. Enable all servers so they auto-start when opening matching filetypes
			local servers = { "clangd", "bashls", "lua_ls", "pyright", "jdtls", "ts_ls", "rust-analyzer" }
			for _, server in ipairs(servers) do
				vim.lsp.enable(server)
			end
		end,
	},
}
