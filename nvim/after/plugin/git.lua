local gitsigns = require("gitsigns")

gitsigns.setup()

vim.keymap.set("n", "<leader>gs", function()
	vim.cmd("vertical Git")
end, { desc = "Open Git" })
vim.keymap.set("n", "<leader>gb", function()
	vim.cmd("Git blame")
end, { desc = "Open Git blame" })