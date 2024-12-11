local neotree = require("neo-tree")
local oil = require("oil")
neotree.setup({
	sources = { "filesystem", "buffers", "git_status" },
	filesystem = {
		filtered_items = {
			visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_by_name = {
				"node_modules",
				".vscode",
			},
			never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
				".DS_Store",
				".git",
				"__pycache__",
			},
		},
	},
})

oil.setup()
vim.keymap.set("n", "<leader>-", oil.toggle_float)
