-- LSP Configuration for Neovim 0.11+

-- ---- Capabilities (with proper encodings) ----
local caps = vim.lsp.protocol.make_client_capabilities()
caps.offsetEncoding = nil
caps.general = caps.general or {}
caps.general.positionEncodings = { "utf-16" } -- LSP 3.17 default

-- ---- Enhanced completion capabilities ----
caps.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

-- ---- Diagnostics look/feel (inline errors etc.) ----
-- LSP keymaps are handled by Snacks pickers instead
vim.diagnostic.config({
	virtual_text = { spacing = 2, prefix = "●" },
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- ---- on_init handler to disable semantic tokens (reduces CPU usage) ----
local function on_init(client, _)
	if vim.fn.has("nvim-0.11") ~= 1 then
		if client.supports_method("textDocument/semanticTokens") then
			client.server_capabilities.semanticTokensProvider = nil
		end
	else
		if client:supports_method("textDocument/semanticTokens") then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end
end

-- ---- Workspace folder keymaps ----
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_workspace_keymaps", { clear = true }),
	callback = function(args)
		local bufnr = args.buf
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
		end
		map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "LSP: Add workspace folder")
		map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "LSP: Remove workspace folder")
		map("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, "LSP: List workspace folders")
	end,
})

-- ---- Apply globals to all servers ----
vim.lsp.config("*", {
	capabilities = caps,
	on_init = on_init,
})

-- ---- Server-specific bits ----
vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--background-index",
		"--log=error",
		"--header-insertion=never",
		"--enable-config",
		"-j",
		"4",
		"--limit-results=0",
		"--limit-references=0",
	},
	filetypes = { "c", "h", "cpp", "hpp", "cc", "cxx", "hh" },
	single_file_support = true,
})

vim.lsp.config("bashls", {
	cmd = { "bash-language-server", "start" },
	filetypes = { "sh", "bash" },
	single_file_support = true,
})

vim.lsp.config("jsonls", {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { "json" },
	single_file_support = true,
})

vim.lsp.config("asm_lsp", {
	cmd = { "asm-lsp" },
	filetypes = { "asm", "s", "S" },
	single_file_support = true,
})

vim.lsp.config("perlnavigator", {
	cmd = { "perlnavigator" },
	filetypes = { "pl", "pm", "t" },
	single_file_support = true,
})

vim.lsp.config("pylsp", {
	settings = {
		pylsp = {
			plugins = {
				black = { enabled = true },
				autopep8 = { enabled = false },
				yapf = { enabled = false },
				pylint = { enabled = true, executable = "pylint" },
				pyflakes = { enabled = false },
				pycodestyle = { enabled = false },
				pylsp_mypy = { enabled = true },
				jedi_completion = { fuzzy = true },
				pyls_isort = { enabled = false },
			},
		},
	},
	flags = { debounce_text_changes = 200 },
	single_file_support = true,
})

-- Lua LSP with proper defaults
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = { checkThirdParty = false },
			diagnostics = { globals = { "vim" } },
			hint = { enable = true },
		},
	},
})

-- Rust support via rust-analyzer
vim.lsp.config("rust_analyzer", {
	cmd = { "rust-analyzer" },
	settings = {
		["rust-analyzer"] = {
			cargo = { allFeatures = true },
			checkOnSave = { command = "clippy" },
			procMacro = { enable = true },
			lens = { enable = true },
			diagnostics = { enable = true },
		},
	},
	single_file_support = true,
})

vim.lsp.config("bitbake", {
	cmd = { "language-server-bitbake", "--stdio" },
	filetypes = { "bitbake" },
	root_dir = function(fname)
		if type(fname) ~= "string" then
			return vim.fn.getcwd()
		end
		local found = vim.fs.find({ "conf", ".git" }, { path = fname, upward = true })[1]
		return found and vim.fs.dirname(found) or vim.fn.getcwd()
	end,
	single_file_support = true,
})

vim.lsp.config("neocmake", {
	-- cmd = { "cmake-language-server", "--stdio" },
	cmd = { "neocmakelsp", "stdio" },
	filetypes = { "cmake" },
	single_file_support = true,
})

vim.lsp.config("yamlls", {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml", "yml" },
	single_file_support = true,
})

vim.lsp.config("groovy", {
	cmd = { "groovy-language-server", "--stdio" },
	filetypes = { "groovy" },
	single_file_support = true,
})

vim.lsp.config("sql_lsp", {
	-- cmd = { "sql-language-server", "up", "--method", "stdio" },
	-- cmd = { "sqls", "--log", "stdio" },
	cmd = { "sqls" },
	filetypes = { "sql" },
	single_file_support = true,
	-- root_markers = { ".git" },
})

-- ---- Enable the servers you want running ----
vim.lsp.enable({
	"neocmake",
	"bitbake",
	"html",
	"cssls",
	"clangd",
	"bashls",
	"lua_ls",
	"pylsp",
	"perlnavigator",
	"dockerls",
	"jsonls",
	"yamlls",
	"groovy",
	"asm_lsp",
	"rust_analyzer",
	"sql_lsp",
})
