-- " %f", -- File name
-- " %{mode()}", -- Current mode
-- " %r", -- Readonly flag
-- " %m", -- Modified flag
-- " %=", -- separator between left and right aligned items
-- " %{&filetype}", -- Filetype
-- ", %2p%%", -- Percentage through file
-- ", %3l:%-2c ", -- Line and column

vim.o.statusline = " %f %r %m %= --%{mode()}-- %{&filetype}, %2p%%,%3l:%-2c "
