vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })

local grug_far = require("grug-far")
local harpoon = require("harpoon")

harpoon:setup()
grug_far.setup({})

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end, { desc = "Add to Harpoon" })
vim.keymap.set("n", "<C-S-P>", function()
	harpoon:list():prev()
end, { desc = "Previous Harpoon file" })
vim.keymap.set("n", "<C-S-N>", function()
	harpoon:list():next()
end, { desc = "Next Harpoon file" })

vim.keymap.set("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
