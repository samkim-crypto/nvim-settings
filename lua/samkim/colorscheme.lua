local colorscheme = "dracula"
-- local colorscheme = "gruvbox"

-- vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox]])

require("everforest").setup({
	-- Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
	-- Default is "medium".
	background = "hard",
	-- How much of the background should be transparent. Options are 0, 1 or 2.
	-- Default is 0.
	--
	-- 2 will have more UI components be transparent (e.g. status line
	-- background).
	transparent_background_level = 0,
	-- Whether italics should be used for keywords, builtin types and more.
	italics = false,
	-- Disable italic fonts for comments. Comments are in italics by default, set
	-- this to `true` to make them _not_ italic!
	disable_italic_comments = false,
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

vim.cmd("hi clear CursorLine")
vim.cmd("hi CursorLine gui=underline cterm=underline")

-- vim.cmd("set colorcolumn=80")
-- vim.cmd("highlight ColorColumn guibg=#6272a4")
