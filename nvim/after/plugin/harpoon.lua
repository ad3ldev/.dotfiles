local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "Add to Harpoon" })
vim.keymap.set("n", "<C-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Show Harpoon Menu" })

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "1st file Harpoon" })
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "2nd file Harpoon" })
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "3rd file Harpoon" })
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "4th file Harpoon" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Previous Harpoon file" })
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Next Harpoon file" })
