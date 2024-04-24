return function()
	--  i hate typing errors
	vim.keymap.set("c", "W", ":w<CR>", { desc = "Save file with capital W" })
	vim.keymap.set("c", "Q", ":q<CR>", { desc = "quit file with capital Q" })
	vim.keymap.set("c", "WQ", ":q<CR>", { desc = "Save and quit file with capital WQ" })
	vim.keymap.set("c", "Q!", ":q!<CR>", { desc = "Quite file without saving with capital Q!" })
end
