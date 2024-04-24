return function()
	-- HEAD: remove the highlighting from the search mode
	vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

	-- HEAD: Telescope
	vim.keymap.set("n", "<leader>t?", "<CMD>Telescope help_tags<CR>", { desc = "Search Help" })
	vim.keymap.set("n", "<leader>tm", "<CMD>Telescope<CR>", { desc = "Search Select Telescope" })
	vim.keymap.set("n", "<leader>tw", "<CMD>Telescope grep_string<CR>", { desc = "Search current Word" })
	vim.keymap.set("n", "<leader>tg", "<CMD>Telescope live_grep<CR>", { desc = "Search by Grep" })
	vim.keymap.set("n", "<leader>td", "<CMD>Telescope diagnostics<CR>", { desc = "Search Diagnostics" })
	vim.keymap.set("n", "<leader>tr", "<CMD>Telescope resume<CR>", { desc = "Search Resume" })
	vim.keymap.set("n", "<leader>t.", "<CMD>Telescope oldfiles<CR>", { desc = "Search Recent Files" })
	vim.keymap.set("n", "<leader><leader>", "<CMD>Telescope buffers<CR>", { desc = "Find existing buffers" })
	vim.keymap.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Search Files" })

	-- HEAD: Diagnostic keymaps
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous Diagnostic message" })
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next Diagnostic message" })
	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic Error messages" })
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic Quickfix list" })

	-- HEAD: Key mappings for cycling through quickfix list
	vim.keymap.set("n", "[q", ":cnext<CR>", { desc = "Go next on Quick fix list" })
	vim.keymap.set("n", "]q", ":cprev<CR>", { desc = "Go previous on Quick fix list " })

	-- HEAD: trouble
	vim.keymap.set("n", "<leader>xx", function()
		require("trouble").toggle()
	end, { desc = "Open trouble menu" })

	vim.keymap.set("n", "<leader>xw", function()
		require("trouble").toggle("workspace_diagnostics")
	end, { desc = "Trouble workspace diagnostics" })

	vim.keymap.set("n", "<leader>xd", function()
		require("trouble").toggle("document_diagnostics")
	end, { desc = "Trouble document diagnostics" })

	vim.keymap.set("n", "<leader>xq", function()
		require("trouble").toggle("quickfix")
	end, { desc = "Trouble quickfix" })

	vim.keymap.set("n", "<leader>xl", function()
		require("trouble").toggle("loclist")
	end, { desc = "Trouble loclist" })

	vim.keymap.set("n", "<leader>xn", function()
		require("trouble").next({ skip_groups = true, jump = true })
	end, { desc = "Trouble next" })

	vim.keymap.set("n", "<leader>xb", function()
		require("trouble").previous({ skip_groups = true, jump = true })
	end, { desc = "Trouble previous" })

	vim.keymap.set("n", "gR", function()
		require("trouble").toggle("lsp_references")
	end, { desc = "Trouble lsp references" })

	-- HEAD: harpoon key maps
	-- Set up a key mapping to add a file mark in Harpoon
	vim.keymap.set("n", "ha", function()
		require("harpoon.mark").add_file()
	end, { desc = "Harpoon mark" })

	-- HEAD: Set up a key mapping to navigate to the next mark in Harpoon
	vim.keymap.set("n", "hn", function()
		require("harpoon.ui").nav_next()
	end, { desc = "Harpoon next" })

	-- HEAD: Set up a key mapping to navigate to the previous mark in Harpoon
	vim.keymap.set("n", "hp", function()
		require("harpoon.ui").nav_prev()
	end, { desc = "Harpoon previous" })

	-- HEAD: Set up a key mapping to display Harpoon marks
	vim.keymap.set("n", "hm", function()
		require("harpoon.ui").toggle_quick_menu()
	end, { desc = "Telescope Harpoon marks" })

	-- HEAD: Set up a key mapping to use Telescope to display Harpoon marks
	vim.keymap.set("n", "<Leader>th", ":Telescope harpoon marks<CR>", { desc = "Telescope Harpoon marks" })

	-- HEAD: redu with sift + u
	vim.api.nvim_set_keymap("n", "<S-u>", "<C-r>", { noremap = true, silent = true, desc = "Just redu" })

	-- HEAD: buffer prev/next key maps
	-- prev
	vim.api.nvim_set_keymap("n", "<leader>bb", ":bp<CR>", { noremap = true, silent = true, desc = "Buffer Previous" })
	-- next
	vim.api.nvim_set_keymap("n", "<leader>bn", ":bn<CR>", { noremap = true, silent = true, desc = "Buffer Next" })

	-- HEAD: Keybinds to make split navigation easier.
	--  Use CTRL+<hjkl> to switch between windows
	--  See `:help wincmd` for a list of all window commands
	vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
	vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
	vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
	vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

	-- HEAD: todo comments keymaps
	vim.keymap.set("n", "]t", function()
		require("todo-comments").jump_next()
	end, { desc = "Next todo comment" })

	vim.keymap.set("n", "[t", function()
		require("todo-comments").jump_prev()
	end, { desc = "Previous todo comment" })
	-- Telescope todo
	vim.keymap.set("n", "<Leader>tt", ":TodoTelescope<CR>", { desc = "Telescope todo marks" })

	-- vim.keymap.set("n", "]t", function()
	-- 	require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING" } })
	-- end, { desc = "Next error/warning todo comment" })

	-- TIP: Disable arrow keys in normal mode
	-- vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
	-- vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
	-- vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
	-- vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
end
