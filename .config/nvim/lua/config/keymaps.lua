vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- in visual mode move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z") -- on line Join keep cursor at same spor

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- on halfpage jusmps keep cursor in the middle
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv") -- keep search terms in the middle of the screen
vim.keymap.set("n", "N", "Nzzzv")


vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- yank into system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", "\"_d") -- delete to the void

vim.keymap.set("n", "Q", "<nop>")
