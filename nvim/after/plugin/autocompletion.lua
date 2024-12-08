vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
local cmp = require("cmp")
local defaults = require("cmp.config.default")()
local luasnip = require("luasnip")
local auto_select = true

luasnip.config.setup({})

cmp.setup({
	auto_brackets = {},
	completion = {
		completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
	},
	preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),

		["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-Space>"] = cmp.mapping.complete({}),

		["<CR>"] = cmp.mapping.confirm({ select = auto_select }),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<S-CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace }),

		["<C-CR>"] = function(fallback)
			cmp.abort()
			fallback()
		end,
		["<C-l>"] = cmp.mapping(function()
			if luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			end
		end, { "i", "s" }),
		["<C-h>"] = cmp.mapping(function()
			if luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
	sorting = defaults.sorting,
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
})
