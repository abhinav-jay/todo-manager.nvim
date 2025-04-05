local core = require("todo.core")

local function add_item()
	vim.ui.input({
		prompt = "Enter priority (0-1000):",
		default = "",
	}, function(key)
		key = tonumber(key)
		if not key or key < 0 or key > 1000 then
			vim.notify("Invalid key! Must be between 0-1000", vim.log.levels.ERROR)
			return
		end

		vim.ui.input({
			prompt = "Enter name of the task:",
		}, function(value)
			if not value or value == "" then
				vim.notify("Value cannot be empty!", vim.log.levels.ERROR)
				return
			end

			local data = core.load_data()
			data[tostring(key)] = value
			core.save_data(data)
			vim.notify(string.format("Added '%s' to todo list!", value))
		end)
	end)
end

return {
	add_item = add_item,
}
