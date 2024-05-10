----------------------------------------------------------
--                                                      --
--      ultra minimalistic and powerful nvim config     --
--                                                      --
----------------------------------------------------------

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- run lazy (and lazy is running the plugins)
require("lazy.init")

-- run the options
require("options.options")

-- run the keys
require("keys.global")
require("keys.normal")
require("keys.insert")
require("keys.visual")
require("keys.visual_block")
require("keys.command")
require("keys.terminal")

-- run Autocommands
require("options.autoCommands")
