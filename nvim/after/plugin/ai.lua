require("vectorcode").setup({
	-- number of retrieved documents
	n_query = 1,
})
local has_vc, vectorcode_config = pcall(require, "vectorcode.config")
local vectorcode_cacher = nil
if has_vc then
	vectorcode_cacher = vectorcode_config.get_cacher_backend()
end

-- roughly equate to 2000 tokens for LLM
local RAG_Context_Window_Size = 8000

require("minuet").setup({
	provider = "openai_fim_compatible",
	n_completions = 1, -- recommend for local model for resource saving
	-- I recommend beginning with a small context window size and incrementally
	-- expanding it, depending on your local computing power. A context window
	-- of 512, serves as an good starting point to estimate your computing
	-- power. Once you have a reliable estimate of your local computing power,
	-- you should adjust the context window to a larger value.
	context_window = 512,
	provider_options = {
		openai_fim_compatible = {
			api_key = "TERM",
			name = "Ollama",
			end_point = "http://localhost:11434/api/generate",
			model = "starcoder2",
			optional = {
				max_tokens = 56,
				top_p = 0.9,
			},
		},
	},
	virtualtext = {
		auto_trigger_ft = { "js", "ts", "jsx", "tsx" },
		keymap = {
			-- accept whole completion
			accept = "<A-A>",
			-- accept one line
			accept_line = "<A-a>",
			-- accept n lines (prompts for number)
			-- e.g. "A-z 2 CR" will accept 2 lines
			accept_n_lines = "<A-z>",
			-- Cycle to prev completion item, or manually invoke completion
			prev = "<A-[>",
			-- Cycle to next completion item, or manually invoke completion
			next = "<A-]>",
			dismiss = "<A-e>",
		},
	},

	template = {
		prompt = function(pref, suff, _)
			local prompt_message = ""
			if has_vc then
				local cache_result = vectorcode_cacher.query_from_cache(0)
				for _, file in ipairs(cache_result) do
					prompt_message = prompt_message .. "<file_sep>" .. file.path .. "\n" .. file.document
				end
			end
			prompt_message = vim.fn.strcharpart(prompt_message, 0, RAG_Context_Window_Size)
			return prompt_message .. "<fim_prefix>" .. pref .. "<fim_suffix>" .. suff .. "<fim_middle>"
		end,
		suffix = false,
	},
})
