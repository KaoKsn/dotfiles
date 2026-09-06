local map = vim.keymap.set

map("i", "<C-H>", "<C-w>")

-- Copying to the system clipboard(xclip, wl-clipboard)
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
map({ "n" }, "<leader>cp", [["+p]], { desc = "Paste from the system clipboard" })

-- Diagnostics
map("n", "<leader>d", function()
	local ok, builtin = pcall(require, "telescope.builtin")
	if ok then
		builtin.diagnostics()
	else
		vim.diagnostic.open_float()
	end
end, { desc = "Show diagnostics (Telescope or Builtin)" })

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

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>")

-- Oil
map("n", "<leader>o", "<cmd>Oil<CR>", { desc = "Open Oil" })

-- options
map("n", "<leader>tl", function()
	vim.opt.list = not vim.opt.list:get()
end, { desc = "Toggle invisible characters" })

-- Code Flow
map("n", "<A-j>", "<cmd>move .+1<CR>", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>move .-2<CR>", { desc = "Move line up" })

map("v", "<A-j>", "<cmd>move '>+1<CR>", { desc = "Move the selected block down" })
map("v", "<A-k>", "<cmd>move '<-2<CR>", { desc = "Move the selected block up" })

-- Help Section
map("n", "<leader>h", function()
	local topic = vim.fn.input("Section: ")

	local ok, err = pcall(vim.cmd, "help " .. topic)
	if not ok then
		vim.notify("Not Found: " .. topic)
	end
end, { desc = "Search Help" })
