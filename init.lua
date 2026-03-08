require "config.options"
require "config.keymaps"
require "config.lazy"
require "config.lspconfig"

-- Auto-update colorscheme on VimLeavePre
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

vim.cmd.colorscheme("rose-pine-dawn")
