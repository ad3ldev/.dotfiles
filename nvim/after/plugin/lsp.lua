vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end
		map("<leader>gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
		map("<leader>gr", require("telescope.builtin").lsp_references, "Goto References")
		map("<leader>gI", require("telescope.builtin").lsp_implementations, "Goto Implementation")
		map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type Definition")
		map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
		map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")
		map("<leader>rn", vim.lsp.buf.rename, "Rename")
		map("<leader>ca", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
		map("<leader>gD", vim.lsp.buf.declaration, "Goto Declaration")
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
			local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})
			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
				end,
			})
		end
		if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
			map("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, "Toggle Inlay Hints")
		end
	end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
local servers = {
	lua_ls = {
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
			},
		},
	},
}
local mason = require("mason")
local ensure_installed = vim.tbl_keys(servers or {})
local mason_tool_installer = require("mason-tool-installer")
local mason_lspconfig = require("mason-lspconfig")
local nvim_lspconfig = require("lspconfig")

capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
ensure_installed = { "shellcheck" }
mason.setup({
	ensure_installed = { "shellcheck" },
})
vim.list_extend(ensure_installed, {
	"stylua", -- Used to format Lua code
})
mason_tool_installer.setup({ ensure_installed = ensure_installed })
mason_lspconfig.setup({
	handlers = {
		function(server_name)
			local server = servers[server_name] or {}
			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
			require("lspconfig")[server_name].setup(server)
		end,
	},
})

vim.diagnostic.config({
	underline = true,
	update_in_insert = false,
	virtual_text = {
		spacing = 4,
		source = "if_many",
		prefix = "icons",
	},
	severity_sort = true,
})

capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.workspace.fileOperations = {
	didRename = true,
	willRename = true,
}

nvim_lspconfig.lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			workspace = {
				checkThirdParty = false,
			},
			codeLens = {
				enable = true,
			},
			completion = {
				callSnippet = "Replace",
			},
			doc = {
				privateName = { "^_" },
			},
			hint = {
				enable = true,
				setType = false,
				paramType = true,
				paramName = "Disable",
				semicolon = "Disable",
				arrayIndex = "Disable",
			},
		},
	},
})

nvim_lspconfig.gopls.setup({
	settings = {
		gopls = {
			completeUnimported = true,
		},
	},
})

nvim_lspconfig.sourcekit.setup({})
