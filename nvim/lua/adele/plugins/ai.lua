return {
	{ "milanglacier/minuet-ai.nvim" },
	{
		"Davidyz/VectorCode",
		version = "*",
		build = "uv tool upgrade vectorcode",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "nvim-lua/plenary.nvim" },
	{ "Saghen/blink.cmp" },
}
