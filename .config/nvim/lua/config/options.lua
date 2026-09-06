-- vim.opt
local set = vim.opt

set.relativenumber = true
set.shiftwidth = 4
set.tabstop = 4
set.smartindent = true
set.breakindent = true -- preserve indent while breaking

set.mouse = "a"
set.showmode = false
-- set.clipboard = "unnamedplus"
set.undofile = true
set.ignorecase = true
set.smartcase = true
set.signcolumn = "yes"
set.updatetime = 250
set.timeoutlen = 300
set.splitright = true
set.splitbelow = true
set.list = false -- Enable listchars
set.listchars = {
	tab = "» ",
	trail = "·",
	nbsp = "␣",
}

set.inccommand = "split" -- Use a different buffer to show diffs.
set.cursorline = true -- highlight current line.
set.scrolloff = 15 -- context lines.
set.confirm = true -- prompt instead of throwing err.
