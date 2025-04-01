require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("", "<leader>p", '"+p<cmd>%s/\\r$//g<CR>', { noremap = true, silent = true })
map("x", "<leader>p", '"+p<cmd>%s/\\r$//g<CR>', { noremap = true, silent = true })

map("", "<leader>P", '"+P<cmd>%s/\\r$//g<CR>', { noremap = true, silent = true })
map("x", "<leader>P", '"+P<cmd>%s/\\r$//g<CR>', { noremap = true, silent = true })
-- next greatest remap ever : asbjornHaland
map({ "", "v" }, "<leader>y", [["+y]])
map("", "<leader>Y", [["+Y]])


