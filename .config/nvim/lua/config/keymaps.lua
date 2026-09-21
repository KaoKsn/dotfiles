local map = vim.keymap.set

map("i", "<C-H>", "<C-w>")

-- Copying to the system clipboard(xclip, wl-clipboard)
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
map({ "n" }, "<leader>cp", [["+p]], { desc = "Paste from the system clipboard" })

-- Diagnostics
map("n", "<leader>td", function()
	local ok, builtin = pcall(require, "telescope.builtin")
	if ok then
		builtin.diagnostics({
			wrap_results = true,
			line_width = "full",
		})
	else
		vim.diagnostic.open_float()
	end
end, { desc = "Telescope full diagnostics" })

map("n", "<leader>d", function()
	vim.diagnostic.open_float()
end, { desc = "Default to vim.diagnostic for diagnostics " })

-- Reload Configuration
map("n", "<leader>r", function()
	-- package.loaded['config.keymaps'] = nil
	dofile(vim.fn.stdpath("config") .. "/init.lua")
	vim.notify("Configuration Reloaded!")
end, { desc = "Configuration Reload" })

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<CR>")
map("n", "<leader>ls", "<cmd>Lazy sync<CR>")
map("n", "<leader>lr", function()
	local plugin = vim.fn.input("Plugin: ")
	local ok, err = pcall(vim.cmd, "Lazy load " .. plugin)
	if not ok then
		vim.notify("Plugin loading failed")
	else
		vim.notify(err)
	end
end, { desc = "Lazy load a plugin" })

-- File writes
map("n", "<leader>wq", "<cmd>wq<CR>", { desc = "Save and quit" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>")

-- Oil
map("n", "<leader>o", "<cmd>Oil<CR>", { desc = "Open Oil" })

-- options
map("n", "<leader>tl", function()
	vim.opt.list = not vim.o.list
end, { desc = "Toggle invisible characters" })

-- Code Flow
map("n", "<A-j>", "<cmd>move .+1<CR>", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>move .-2<CR>", { desc = "Move line up" })

map("v", "<A-j>", "<cmd>move '>+1<CR>", { desc = "Move the selected block down" })
map("v", "<A-k>", "<cmd>move '<-2<CR>", { desc = "Move the selected block up" })

-- Help Section
map("n", "<leader>h", function()
	local topic = vim.fn.input("Section: ")

	local ok --[[, err]] = pcall(vim.cmd, "help " .. topic)
	if not ok then
		vim.notify("Not Found: " .. topic)
	end
end, { desc = "Search Help" })

-- Boiler Plates
local boilerplates = require("templates.boilerplates")

vim.keymap.set("n", "<leader>bp", function()
	local lang = vim.fn.input("lang (cpp/c/html/py): ")
	if not lang or lang == "" then
		lang = "cpp"
	end

	local bp = boilerplates[lang]
	if not bp then
		vim.notify("Unknown language: " .. lang, vim.log.levels.WARN)
		return
	end

	local cursor_info = vim.api.nvim_win_get_cursor(0)

	local current_col_pos = cursor_info[1] -- row
	if not current_col_pos then
		current_col_pos = 0
	end
	-- (lines, type, after, follow)
	vim.api.nvim_put(bp.code, "l", false, true) -- Start boilerplate from the current line
	-- Handle relative boilerpasting.
	vim.api.nvim_win_set_cursor(0 --[[current window]], { bp.cursor[1] + current_col_pos - 1, bp.cursor[2] })
	print("")
end, { desc = "Insert code boilerplate" })

-- Compilation
map("n", "<leader>com", function()
	-- vim.bo.buftype == "terminal" avoid writing to the terminal.
	local ok = pcall(vim.cmd, "write")
	if not ok then
		vim.notify("Switch back to your C file before compiling!", vim.log.levels.WARN)
		return
	end
	local file, output = vim.fn.expand("%"), vim.fn.expand("%:r") -- get the root name.
	local cmd = string.format("(make || gcc %s -o %s) && exit", file, output)

	vim.cmd("belowright split | term " .. cmd)
	vim.api.nvim_win_set_height(0, 5)
	-- Automatically close the split window when the shell exits successfully
	local bufnr = vim.api.nvim_get_current_buf()
	vim.api.nvim_create_autocmd("TermClose", {
		buffer = bufnr,
		once = true,
		callback = function()
			vim.cmd("bdelete!")
		end,
	})
end, { desc = "Compiling source code" })

-- Terminal
map("n", "<leader>term", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 10)
	vim.notify("terminal is ready")
end)
