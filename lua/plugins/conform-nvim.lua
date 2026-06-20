return {
	"stevearc/conform.nvim",
	-- event = 'BufWritePre', -- uncomment for format on save
	lazy = false,
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- css = { "prettier" },
			-- html = { "prettier" },
			sh = { "shfmt" },
			cpp = { "clang-format" },
			asm = { "asmfmt" },
			json = { "jq" },
			cmake = { "cmake-format" },
		},
		formatters = {
			clang_format = {
				prepend_args = { "--style=file", "--fallback-style=LLVM" },
			},
			shfmt = {
				prepend_args = { "-i", "4" },
			},
		},
		-- format_on_save = {
		--   -- These options will be passed to conform.format()
		--   timeout_ms = 500,
		--   lsp_fallback = true,
		-- },
	},
}
