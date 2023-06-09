require("samkim.plugins")
require("samkim.plugin-settings")
require("samkim.colorscheme")
require("samkim.cmp")
require("samkim.lsp")
require("samkim.autopairs")
require("samkim.treesitter")
require("samkim.nvim-tree")
require("samkim.airline")
require("samkim.null-ls")
require("samkim.telescope")
require("samkim.floaterm")
require("samkim.options")
require("samkim.keymaps")

vim.cmd("autocmd BufEnter * set formatoptions-=ro")
vim.cmd("autocmd BufEnter *.tex set conceallevel=0")
-- vim.cmd("set conceallevel=0")
vim.cmd("let g:vimtex_syntax_conceal_disable = 1")
vim.cmd("set tw=80")
