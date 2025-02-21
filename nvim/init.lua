-- Set leader key early
vim.g.mapleader = " "

-- Load configuration
require("config.lazy")
require("config.options")
require("config.keymaps")
require("config.autocmds")
