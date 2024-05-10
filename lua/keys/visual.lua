local key = function(key, commands, desc)
	vim.keymap.set("v", key, commands, { desc = desc or "" })
end

------------------------------------------------------------------------------

-- HEAD: move the selected text up or down
key("J", ":m '>+1<CR>gv=gv", "Move selected text up")
key("K", ":m '<-2<CR>gv=gv", "Move selected text down")
key("<S-Down>", ":m '>+1<CR>gv=gv", "Move selected text up")
key("<S-Up>", ":m '<-2<CR>gv=gv", "Move selected text down")
