local key = function(key, commands, desc)
	vim.keymap.set("n", key, commands, { desc = desc or "" })
end

------------------------------------------------------------------------------

-- HEAD: remove the highlighting from the search mode
key("<Esc>", "<cmd>nohlsearch<CR>")

-- HEAD: Telescope
local builtin = require("telescope.builtin")
key("<leader>t?", "<CMD>Telescope help_tags<CR>", "Search Help")
key("<leader>tm", "<CMD>Telescope<CR>", "Search Select Telescope")
key("<leader>tw", "<CMD>Telescope grep_string<CR>", "Search current Word")
key("<leader>tg", "<CMD>Telescope live_grep<CR>", "Search by Grep")
key("<leader>td", "<CMD>Telescope diagnostics<CR>", "Search Diagnostics")
key("<leader>tr", "<CMD>Telescope resume<CR>", "Search Resume")
key("<leader>t.", "<CMD>Telescope oldfiles<CR>", "Search Recent Files")
key("<leader><leader>", "<CMD>Telescope buffers<CR>", "Find existing buffers")
key("<leader>ff", "<CMD>Telescope find_files<CR>", "Search Files")
key("<C-s>", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, "Fuzzily search in current buffer")
key("<leader>s/", function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, "Search in Opened Files")
key("<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, "Search Neovim files")

-- HEAD: Diagnostic keymaps
key("[d", vim.diagnostic.goto_prev, "Go to previous Diagnostic message")
key("]d", vim.diagnostic.goto_next, "Go to next Diagnostic message")
key("<leader>e", vim.diagnostic.open_float, "Show diagnostic Error messages")
key("<leader>q", vim.diagnostic.setloclist, "Open diagnostic Quickfix list")

-- HEAD: Key mappings for cycling through quickfix list
key("[q", "<cmd>cnext<CR>", "Go next on Quick fix list")
key("]q", "<cmd>cprev<CR>", "Go previous on Quick fix list ")

-- HEAD: redu with sift + u
key("<S-u>", "<C-r>", "Just redu")

-- HEAD: buffer prev/next key maps
-- prev
key("<leader>bb", "<cmd>bp<CR>", "Buffer Previous")
-- next
key("<leader>bn", "<cmd>bn<CR>", "Buffer Next")
-- Recent
key("t", "<cmd>b#<CR>", "Buffer Recent")

-- HEAD: bundo tree
key("<leader>tu", "<cmd>UndotreeToggle<CR>", "Toggle Undotree")

-- HEAD: Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
key("<C-h>", "<C-w><C-h>", "Move focus to the left window")
key("<C-l>", "<C-w><C-l>", "Move focus to the right window")
key("<C-j>", "<C-w><C-j>", "Move focus to the lower window")
key("<C-k>", "<C-w><C-k>", "Move focus to the upper window")

-- HEAD: trouble
key("<leader>xx", function()
	require("trouble").toggle()
end, "Open trouble menu")

key("<leader>xw", function()
	require("trouble").toggle("workspace_diagnostics")
end, "Trouble workspace diagnostics")

key("<leader>xd", function()
	require("trouble").toggle("document_diagnostics")
end, "Trouble document diagnostics")

key("<leader>xq", function()
	require("trouble").toggle("quickfix")
end, "Trouble quickfix")

key("<leader>xl", function()
	require("trouble").toggle("loclist")
end, "Trouble loclist")

key("<leader>xn", function()
	require("trouble").next({ skip_groups = true, jump = true })
end, "Trouble next")

key("<leader>xb", function()
	require("trouble").previous({ skip_groups = true, jump = true })
end, "Trouble previous")

key("gR", function()
	require("trouble").toggle("lsp_references")
end, "Trouble lsp references")

-- HEAD: todo comments keymaps
key("]t", function()
	require("todo-comments").jump_next()
end, "Next todo comment")

key("[t", function()
	require("todo-comments").jump_prev()
end, "Previous todo comment")

key("<Leader>tt", "<cmd>TodoTelescope<CR>", "Telescope todo marks")
