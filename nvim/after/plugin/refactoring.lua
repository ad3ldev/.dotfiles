local refactoring = require("refactoring")

refactoring.setup({
	prompt_func_return_type = {
		go = false,
		java = false,

		cpp = false,
		c = false,
		h = false,
		hpp = false,
		cxx = false,
	},
	prompt_func_param_type = {
		go = false,
		java = false,

		cpp = false,
		c = false,
		h = false,
		hpp = false,
		cxx = false,
	},
	printf_statements = {},
	print_var_statements = {},
	show_success_message = false, -- shows a message with information about the refactor on success
})

vim.keymap.set("x", "<leader>re", ":Refactor extract ", { desc = "Refactor extract function" })
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ", { desc = "Refactor extract function to a file" })

vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ", { desc = "Refactor extract variable" })

vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var", { desc = "Refactor inline variable" })

vim.keymap.set("n", "<leader>rI", ":Refactor inline_func", { desc = "Refactor inline function" })

vim.keymap.set("n", "<leader>rb", ":Refactor extract_block", { desc = "Refactor extract block" })
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file", { desc = "Refactor extract block to file" })
vim.keymap.set({ "n", "x" }, "<leader>rr", function()
	require("telescope").extensions.refactoring.refactors()
end, { desc = "Refactor using telescope" })
