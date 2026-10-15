local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.showmode = false -- lualine shows the mode
opt.laststatus = 3 -- single global statusline
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.fillchars = { eob = " " }
opt.splitright = true
opt.splitbelow = true
opt.pumheight = 10
opt.winborder = "rounded"

-- Editing
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true
opt.breakindent = true
opt.mouse = "a"
opt.virtualedit = "block"
opt.confirm = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

-- Files
opt.undofile = true
opt.swapfile = false

-- Timing
opt.updatetime = 250
opt.timeoutlen = 300

-- Copy to the system clipboard with OSC 52 (Ghostty, through tmux) instead of wl-copy:
-- on GNOME wl-copy/wl-paste open a hidden window per call, which pops up a
-- "wl-clipboard is ready" notification on every dd/x. Paste returns Neovim's own last
-- copy; paste text from other apps with Ctrl+Shift+V (works in normal mode too).
local osc52 = require("vim.ui.clipboard.osc52")
local last = { {}, "v" }
local function copy(reg)
  local send = osc52.copy(reg)
  return function(lines, regtype)
    last = { lines, regtype }
    send(lines, regtype)
  end
end
vim.g.clipboard = {
  name = "OSC 52",
  copy = { ["+"] = copy("+"), ["*"] = copy("*") },
  paste = {
    ["+"] = function() return last end,
    ["*"] = function() return last end,
  },
}

-- Sync with system clipboard
vim.schedule(function()
  opt.clipboard = "unnamedplus"
end)

-- Diagnostics
vim.diagnostic.config({
  severity_sort = true,
  virtual_text = { spacing = 2, source = "if_many" },
  float = { source = "if_many" },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = "󰌵 ",
    },
  },
})
