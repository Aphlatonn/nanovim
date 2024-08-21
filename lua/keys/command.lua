local key = function(key, commands, desc)
	vim.keymap.set("c", key, commands, { desc = desc or "" })
end

------------------------------------------------------------------------------

-- i hate typing errors
key("W", "<cmd>w<CR>", "Save file with capital W")
key("Q", "<cmd>q<CR>", "quit file with capital Q")
key("WQ", "<cmd>wq<CR>", "Save and quit file with capital WQ")
key("Q!", "<cmd>q!<CR>", "Quite file without saving with capital Q!")
