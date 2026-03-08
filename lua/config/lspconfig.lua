-- LSP Configuration for Neovim 0.11+

-- ---- Capabilities (with proper encodings) ----
local caps = vim.lsp.protocol.make_client_capabilities()
caps.offsetEncoding = nil
caps.general = caps.general or {}
caps.general.positionEncodings = { "utf-16" } -- LSP 3.17 default

-- ---- Diagnostics look/feel (inline errors etc.) ----
-- LSP keymaps are handled by Snacks pickers instead
vim.diagnostic.config {
	virtual_text = { spacing = 2, prefix = "●" },
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
}

-- ---- Apply globals to all servers ----
vim.lsp.config("*", {
	capabilities = caps,
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

-- ---- Enable the servers you want running ----
vim.lsp.enable({
	"html",
	"cssls",
	"clangd",
	"bashls",
	"lua_ls",
	"pylsp",
	"perlnavigator",
	"dockerls",
	"jsonls",
	"asm_lsp",
	"rust_analyzer",
})
