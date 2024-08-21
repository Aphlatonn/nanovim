local key = function(key, commands, desc)
	vim.keymap.set("t", key, commands, { desc = desc or "" })
end

------------------------------------------------------------------------------

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
key("<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode")
