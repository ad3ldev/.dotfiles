return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			-- add blink.compat to dependencies
			{
				"saghen/blink.compat",
				optional = true, -- make optional so it's only enabled if any extras need it
				opts = {},
				version = not vim.g.lazyvim_blink_main and "*",
			},
			"xzbdmw/colorful-menu.nvim",
		},
		event = { "InsertEnter", "CmdlineEnter" },

		version = "1.*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "default",
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
				-- Trigger completion
				["<C-Space>"] = { "show", "fallback" },
				-- Confirm selections
				["<S-CR>"] = { "select_and_accept", "fallback" },
				["<CR>"] = { "accept", "fallback" },
				-- Navigate completion menu
				["<C-n>"] = { "select_next", "fallback" },
				["<C-p>"] = { "select_prev", "fallback" },
				-- Abort completion
				["<C-CR>"] = { "cancel", "fallback" },
				-- Snippet navigation
				["<C-l>"] = { "snippet_forward", "fallback" },
				["<C-h>"] = { "snippet_backward", "fallback" },

				["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
			},

			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				accept = {
					auto_brackets = {
						enabled = true,
					},
				},
				menu = {
					draw = {
						columns = { { "kind_icon" }, { "label", gap = 1 }, { "kind", "source_name", gap = 1 } },
						components = {
							label = {
								text = function(ctx)
									return require("colorful-menu").blink_components_text(ctx)
								end,
								highlight = function(ctx)
									return require("colorful-menu").blink_components_highlight(ctx)
								end,
							},
						},
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
				},
				ghost_text = {
					enabled = vim.g.ai_cmp,
				},
			},
			sources = {
				compat = {},
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
			signature = {
				enabled = true,
				window = {
					border = "rounded",
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = {
			"sources.completion.enabled_providers",
			"sources.compat",
			"sources.default",
		},
	},
	{
		"rafamadriz/friendly-snippets",
		{
			"saghen/blink.compat",
			optional = true, -- make optional so it's only enabled if any extras need it
			opts = {},
			version = not vim.g.lazyvim_blink_main and "*",
		},
	},
	{
		"saghen/blink.compat",
		optional = true, -- make optional so it's only enabled if any extras need it
		opts = {},
		version = not vim.g.lazyvim_blink_main and "*",
	},
}
