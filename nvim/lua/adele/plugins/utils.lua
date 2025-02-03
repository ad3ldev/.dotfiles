return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		settings = {
			save_on_toggle = true,
		},
		keys = function()
			local keys = {
				{
					"<leader>h",
					function()
						local harpoon = require("harpoon")
						harpoon.ui:toggle_quick_menu(harpoon:list())
					end,
					desc = "Harpoon Quick Menu",
				},
			}

			for i = 1, 5 do
				table.insert(keys, {
					"<leader>" .. i,
					function()
						require("harpoon"):list():select(i)
					end,
					desc = "Harpoon to File " .. i,
				})
			end
			return keys
		end,
	},
	{
		"mbbill/undotree",
	},
	{
		"tpope/vim-sleuth",
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {},
		keys = {
			{
				"<leader>qs",
				function()
					require("persistence").load()
				end,
				desc = "Restore Session",
			},
			{
				"<leader>qS",
				function()
					require("persistence").select()
				end,
				desc = "Select Session",
			},
			{
				"<leader>ql",
				function()
					require("persistence").load({ last = true })
				end,
				desc = "Restore Last Session",
			},
			{
				"<leader>qd",
				function()
					require("persistence").stop()
				end,
				desc = "Don't Save Current Session",
			},
		},
	},
	{ "nvim-lua/plenary.nvim", lazy = true },
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		config = function()
			vim.g.startuptime_tries = 10
		end,
	},
	{
		"MagicDuck/grug-far.nvim",
		cmd = "GrugFar",
		keys = {
			{
				"<leader>sr",
				function()
					local grug = require("grug-far")
					local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
					grug.open({
						transient = true,
						prefills = {
							filesFilter = ext and ext ~= "" and "*." .. ext or nil,
						},
					})
				end,
				mode = { "n", "v" },
				desc = "Search and Replace",
			},
		},
	},
	{
		"folke/trouble.nvim",
		cmd = { "Trouble" },
		opts = {
			modes = {
				lsp = {
					win = { position = "right" },
				},
			},
		},
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
			{
				"[q",
				function()
					if require("trouble").is_open() then
						require("trouble").prev({ skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cprev)
						if not ok then
							vim.notify(err, vim.log.levels.ERROR)
						end
					end
				end,
				desc = "Previous Trouble/Quickfix Item",
			},
			{
				"]q",
				function()
					if require("trouble").is_open() then
						require("trouble").next({ skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cnext)
						if not ok then
							vim.notify(err, vim.log.levels.ERROR)
						end
					end
				end,
				desc = "Next Trouble/Quickfix Item",
			},
		},
	},
	{
		"mistweaverco/kulala.nvim",
		ft = "http",
		opts = {},
		keys = {
			{ "<leader>HR", mode = "n", desc = "+Rest" }, -- Fixed the empty command
			{ "<leader>HRb", "<cmd>lua require('kulala').scratchpad()<cr>", desc = "Open scratchpad" },
			{ "<leader>HRc", "<cmd>lua require('kulala').copy()<cr>", desc = "Copy as cURL" },
			{ "<leader>HRC", "<cmd>lua require('kulala').from_curl()<cr>", desc = "Paste from curl" },
			{
				"<leader>HRg",
				"<cmd>lua require('kulala').download_graphql_schema()<cr>",
				desc = "Download GraphQL schema",
			},
			{ "<leader>HRi", "<cmd>lua require('kulala').inspect()<cr>", desc = "Inspect current request" },
			{ "<leader>HRn", "<cmd>lua require('kulala').jump_next()<cr>", desc = "Jump to next request" },
			{ "<leader>HRp", "<cmd>lua require('kulala').jump_prev()<cr>", desc = "Jump to previous request" },
			{ "<leader>HRq", "<cmd>lua require('kulala').close()<cr>", desc = "Close window" },
			{ "<leader>HRr", "<cmd>lua require('kulala').replay()<cr>", desc = "Replay the last request" },
			{ "<leader>HRs", "<cmd>lua require('kulala').run()<cr>", desc = "Send the request" },
			{ "<leader>HRS", "<cmd>lua require('kulala').show_stats()<cr>", desc = "Show stats" },
			{ "<leader>HRt", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle headers/body" },
		},
	},
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_compiler_latexmk = {
				executable = "tectonic", -- use Tectonic instead of latexmk
				build_dir = "", -- use the current directory for auxiliary files
				options = {
					"--synctex", -- enable SyncTeX for forward/inverse search
					"--keep-logs", -- optionally keep log files
					"--keep-intermediates", -- optionally keep intermediate files
				},
				continuous = 0, -- disable continuous compilation (Tectonic doesn’t support it)
				callback = 1, -- enable VimTeX callbacks (for status updates)
			}
		end,
	},
	{
		"isak102/ghostty.nvim",
		config = function()
			require("ghostty").setup()
		end,
	},
}
