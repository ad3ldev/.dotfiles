vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })

local harpoon = require("harpoon")
-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end, { desc = "Add to Harpoon" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function()
	harpoon:list():prev()
end, { desc = "Previous Harpoon file" })
vim.keymap.set("n", "<C-S-N>", function()
	harpoon:list():next()
end, { desc = "Next Harpoon file" })
