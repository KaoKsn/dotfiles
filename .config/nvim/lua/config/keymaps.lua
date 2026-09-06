local map = vim.keymap.set

map("i", "<C-H>", "<C-w>")

-- Reload Configuration
map("n", "<leader>r", function()
	-- package.loaded['config.keymaps'] = nil
	dofile(vim.fn.stdpath("config") .. "/init.lua")
	vim.notify("Configuration Reloaded!")
end, { desc = "Configuration Reload" })

-- Lazy
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>")
vim.keymap.set("n", "<leader>ls", "<cmd>Lazy sync<CR>")

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

-- Move highlighted block up and down in Visual mode
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Help Section
map("n", "<leader>h", function()
	local topic = vim.fn.input("Section: ")

	local ok, err = pcall(vim.cmd, "help " .. topic)
	if not ok then
		vim.notify("Not Found: " .. topic)
	end
end, { desc = "Search Help" })
