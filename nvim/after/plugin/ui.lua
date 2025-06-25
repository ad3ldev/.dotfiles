local tokyonight = require("tokyonight")
local lualine = require("lualine")
local barbecue = require("barbecue")
local colorizer = require("colorizer")

tokyonight.setup({
	on_colors = function(colors)
		vim.api.nvim_set_hl(0, "LineNrAbove", { fg = colors.comment })
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
colorizer.setup()

vim.cmd.colorscheme("tokyonight")

vim.fn.sign_define("DapBreakpoint", { text = "🔴", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })
vim.fn.sign_define("DapBreakpointCondition", { text = "🔴", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })
vim.fn.sign_define("DapBreakpointRejected", { text = "🟠", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })
vim.fn.sign_define("DapStopped", { text = "🟢", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })
vim.fn.sign_define("DapLogPoint", { text = "🟡", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })
