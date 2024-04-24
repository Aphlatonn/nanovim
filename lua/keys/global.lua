return function()
	-- HEAD: intract with system clipboard
	-- Paste
	vim.api.nvim_set_keymap("", "<Leader>p", '"+p', { noremap = true, desc = "Paste from system clipboard" })
	-- Yank
	vim.api.nvim_set_keymap("", "<Leader>y", '"+y', { noremap = true, desc = "Yank to system clipboard" })
end
