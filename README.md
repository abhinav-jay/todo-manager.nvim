# Keybinds
- `<leader>tds` show the most important item on the todo list.
- `<leader>tda` add an item to the todo list.
- `<leader>tdr` remove the most important item from the todo list.

# Installation
Install with your favorite plugin manager, example with lazy.nvim:
``` lua
{
    "abhinav-jay/todo-manager.nvim",
}
```
Actually, I don't know if this really works. Anyway, you can do this if you want in a terminal.
``` bash
git clone https://github.com/abhinav-jay/todo-manager.nvim ~/.config/nvim/todo/
echo 'require("todo").setup()' >> ~/.config/nvim/init lua
```
# Notes
This plugin is very new, there may be some bugs. If there are any bugs, please report them in the issues section. 
