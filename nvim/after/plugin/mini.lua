local ai = require("mini.ai")
local surround = require("mini.surround")
local comment = require("mini.comment")
local pairs = require("mini.pairs")
local icons = require("mini.icons")

ai.setup({
	n_lines = 500,
	custom_textobjects = {
		o = ai.gen_spec.treesitter({ -- code block
			a = { "@block.outer", "@conditional.outer", "@loop.outer" },
			i = { "@block.inner", "@conditional.inner", "@loop.inner" },
		}),
		f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
		c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
		t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
		d = { "%f[%d]%d+" }, -- digits
		e = { -- Word with case
			{ "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
			"^().*()$",
		},
		i = ai.indent, -- indent
		g = ai.buffer, -- buffer
		u = ai.gen_spec.function_call(), -- u for "Usage"
		U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
	},
})
surround.setup()
comment.setup()
pairs.setup({
	modes = { insert = true, command = true, terminal = false },
	skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
	skip_ts = { "string" },
	skip_unbalanced = true,
	markdown = true,
})
icons.setup({
	file = {
		[".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
		["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
	},
	filetype = {
		dotenv = { glyph = "", hl = "MiniIconsYellow" },
	},
})
vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesActionRename",
	callback = function(event)
		Snacks.rename.on_rename_file(event.data.from, event.data.to)
	end,
})
