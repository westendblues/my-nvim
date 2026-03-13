-- Colorscheme persistence
-- Auto-updates init.lua with current colorscheme on exit

vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		local current_colorscheme = vim.g.colors_name or "rose-pine-dawn"
		local init_file = vim.fn.stdpath("config") .. "/init.lua"
		local content = vim.fn.readfile(init_file)
		local updated = false

		for i, line in ipairs(content) do
			-- Match only the final colorscheme line (at end, not in comment/code)
			if line:match("^vim%.cmd%.colorscheme%(['\"]") then
				content[i] = 'vim.cmd.colorscheme("' .. current_colorscheme .. '")'
				updated = true
				break
			end
		end

		if updated then
			vim.fn.writefile(content, init_file)
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.bb", "*.bbappend", "*.bbclass", "*.inc", "local.conf", "poky/*/*.conf", "*.conf" },
	callback = function()
		vim.bo.filetype = "bitbake"
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*.bb", "*.bbappend", "*.bbclass", "*.inc", "local.conf", "poky/*/*.conf" },
	callback = function()
		vim.lsp.start({
			name = "bitbake",
			cmd = { "language-server-bitbake", "--stdio" },
		})
	end,
})
