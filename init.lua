local add = require("todo.add")
local remove = require("todo.remove")
local show = require("todo.show")

local function setup()
	vim.keymap.set("n", "<leader>tda", add.add_item, { desc = "Todo: Add item" })
	vim.keymap.set("n", "<leader>tdr", remove.remove_highest, { desc = "Todo: Remove highest" })
	vim.keymap.set("n", "<leader>tds", show.show_highest, { desc = "Todo: Show highest" })
end

return {
	setup = setup,
}
