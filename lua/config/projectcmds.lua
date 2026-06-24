-- ~/.config/nvim/lua/project_commands.lua

local M = {}

local function load_config()
	local path = vim.fn.getcwd() .. "/.nvim/project.json"

	if vim.fn.filereadable(path) == 0 then
		return {}
	end

	local ok, lines = pcall(vim.fn.readfile, path)
	if not ok then
		vim.notify("Could not read " .. path, vim.log.levels.ERROR)
		return {}
	end

	local ok_json, config = pcall(vim.json.decode, table.concat(lines, "\n"))
	if not ok_json then
		vim.notify("Invalid JSON in " .. path, vim.log.levels.ERROR)
		return {}
	end

	return config or {}
end

local function run(cmd)
	if not cmd or cmd == "" then
		vim.notify("No command configured", vim.log.levels.WARN)
		return
	end

	vim.cmd("botright 12new")
	vim.bo.bufhidden = "wipe"
	vim.fn.termopen(cmd, { cwd = vim.fn.getcwd() })
	vim.cmd("startinsert")
end

function M.build()
	run(load_config().build)
end

function M.run()
	run(load_config().run)
end

function M.setup()
	vim.keymap.set("n", "<space>bb", M.build, { desc = "Build project" })
	vim.keymap.set("n", "<space>rr", M.run, { desc = "Run project" })
end

return M
