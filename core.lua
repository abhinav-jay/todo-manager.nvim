local M = {}

local json = require("dkjson")
local data_file = vim.fn.stdpath("config") .. "/lua/todo/data.json"

-- Initialize data file if it doesn't exist
local function ensure_data_file()
	local file = io.open(data_file, "r")
	if not file then
		file = io.open(data_file, "w")
		file:write("{}")
		file:close()
	end
end

-- Load data
function M.load_data()
	ensure_data_file()
	local file = io.open(data_file, "r")
	local content = file:read("*a")
	file:close()
	return json.decode(content) or {}
end

-- Save data
function M.save_data(data)
	local json_data = {}
	for k, v in pairs(data) do
		json_data[tostring(k)] = v
	end

	local file = io.open(data_file, "w")
	file:write(json.encode(json_data, { indent = true }))
	file:close()
end

-- Create floating window
function M.create_window(title)
	local width = 60
	local height = 1
	local buf = vim.api.nvim_create_buf(false, true)

	local ui = vim.api.nvim_list_uis()[1]
	local opts = {
		relative = "editor",
		width = width,
		height = height,
		col = (ui.width - width) / 2,
		row = (ui.height - height) / 3,
		style = "minimal",
		border = "rounded",
		title = title,
		title_pos = "center",
	}

	local win = vim.api.nvim_open_win(buf, true, opts)
	vim.api.nvim_win_set_option(win, "winhl", "Normal:NormalFloat")

	return buf, win
end

return M
