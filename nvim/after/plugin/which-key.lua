local wk = require("which-key")
wk.register(mappings, opts)
vim.keymap.set("n", "<leader>wk", "<cmd>WhichKey<CR>", {desc = "Which Key"})
