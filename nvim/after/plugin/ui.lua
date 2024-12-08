local bufferline = require("bufferline")
local tokyonight = require("tokyonight")
local lualine = require("lualine")
local barbecue = require("barbecue")
local ibl = require("ibl")
bufferline.setup()
tokyonight.setup({
	on_colors = function(colors)
		vim.api.nvim_set_hl(0, "LineNrAbove", { fg = colors.comment })
		vim.api.nvim_set_hl(0, "LineNr", { fg = colors.fg_sidebar })
		vim.api.nvim_set_hl(0, "LineNrBelow", { fg = colors.comment })
	end,
})
lualine.setup({
	options = {
		theme = "tokyonight",
	},
})
barbecue.setup({
	theme = "tokyonight",
})
ibl.setup()

vim.cmd.colorscheme("tokyonight")
