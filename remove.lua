local core = require("todo.core")

local function remove_highest()
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

	if not highest_key then
		vim.notify("No items to remove", vim.log.levels.WARN)
		return
	end

	data[tostring(highest_key)] = nil
	core.save_data(data)
	vim.notify(string.format("Removed: [%d] = '%s'", highest_key, highest_value))
end

return {
	remove_highest = remove_highest,
}
