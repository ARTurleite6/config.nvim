local map = vim.keymap.set

map("n", "-", "<CMD>Oil<CR>", { desc = "Oil: Open parent directory" })

require("config.keymaps.snacks")
require("config.keymaps.lsp")

