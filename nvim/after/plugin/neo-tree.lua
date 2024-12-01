require("neo-tree").setup({
	filesystem = {
		filtered_items = {
			visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_by_name = {
				"node_modules",
			},
			never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
				".DS_Store",
				".git",
				"__pycache__",
			},
		},
	},
})
