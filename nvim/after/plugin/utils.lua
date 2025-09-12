vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })

local grug_far = require("grug-far")
local harpoon = require("harpoon")
local diagram = require("diagram")
local image = require("image")

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

diagram.setup({
	integrations = {
		require("diagram.integrations.markdown"),
		require("diagram.integrations.neorg"),
	},
	renderer_options = {
		mermaid = {
			theme = "forest",
		},
		plantuml = {
			charset = "utf-8",
		},
		d2 = {
			theme_id = 1,
		},
		gnuplot = {
			theme = "dark",
			size = "800,600",
		},
	},
})

image.setup({
	backend = "kitty", -- or "ueberzug" or "sixel"
	processor = "magick_cli", -- or "magick_rock"
	integrations = {
		markdown = {
			enabled = true,
			clear_in_insert_mode = false,
			download_remote_images = true,
			only_render_image_at_cursor = false,
			only_render_image_at_cursor_mode = "popup", -- or "inline"
			floating_windows = false, -- if true, images will be rendered in floating markdown windows
			filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
		},
		neorg = {
			enabled = true,
			filetypes = { "norg" },
		},
		typst = {
			enabled = true,
			filetypes = { "typst" },
		},
		html = {
			enabled = false,
		},
		css = {
			enabled = false,
		},
	},
	max_width = nil,
	max_height = nil,
	max_width_window_percentage = nil,
	max_height_window_percentage = 50,
	scale_factor = 1.0,
	window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
	window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
	editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
	tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
	hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
})
