local core = require("todo.core")

local function show_highest()
	local data = core.load_data()
	local highest_key = nil
	local highest_value = nil

	for k, v in pairs(data) do
		local num = tonumber(k)
		if num and (not highest_key or num > highest_key) then
			highest_key = num
			highest_value = v
		end
	end

	if highest_key then
		local buf, win = core.create_window("Highest Priority Todo")
		local lines = {
			string.format("Most important: %s", highest_value),
			"Press q to close",
		}
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
		vim.api.nvim_buf_set_keymap(buf, "n", "q", ":q<CR>", { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(buf, "n", "<ESC>", ":q<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_option_value("filetype", "todo", { buf = buf })
	else
		vim.notify("No todo items found", vim.log.levels.INFO)
	end
end

return {
	show_highest = show_highest,
}
