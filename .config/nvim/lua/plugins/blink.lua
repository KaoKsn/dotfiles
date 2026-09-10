return {
	{
		"saghen/blink.cmp",
		-- Optional: use a release tag to download pre-built binaries (recommended)
		version = "1.*",
		dependencies = {
			-- Provides a massive collection of pre-built snippets (e.g. for JS, Python, etc.)
			"rafamadriz/friendly-snippets",
		},

		opts = {
			-- 'default' for mappings similar to cmp-nvim-lsp
			-- 'super-tab' for Tab-based navigation (VS Code style)
			-- 'enter' for Enter to accept
			keymap = { preset = "default" },

			appearance = {
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons align properly
				nerd_font_variant = "mono",
			},

			-- Default sources to pull completion candidates from
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			-- Experimental signature help support (shows parameters while typing function args)
			signature = { enabled = true },

			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
				},
				ghost_text = {
					enabled = true,
				},
			},
		},
		opts_extend = { "sources.default" },
	},
}
