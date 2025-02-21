-- NvimTree keymaps
vim.keymap.set("n", "<C-n>", function()
  require("nvim-tree.api").tree.toggle()
  vim.cmd("wincmd l") -- Move focus to main editor if NvimTree is open
end, { noremap = true, silent = true })

vim.keymap.set("n", "<C-b>", function()
  local tree_view = require("nvim-tree.view")
  if tree_view.is_visible() then
    if vim.fn.win_getid() == tree_view.get_winnr() then
      vim.cmd("wincmd l") -- Move to editor
    else
      vim.cmd("wincmd h") -- Move to NvimTree
    end
  end
end, { noremap = true, silent = true })


-- bufferline keymaps

-- Move between buffers
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

-- Close current buffer
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true })

-- Move buffers around
vim.keymap.set("n", "<leader>bp", ":BufferLineMovePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bn", ":BufferLineMoveNext<CR>", { noremap = true, silent = true })

-- Telescope keymaps
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Grep string" })
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find recent files" })
vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "List commands" })
vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "Find marks" })
vim.keymap.set("n", "<leader>fr", builtin.registers, { desc = "Find registers" })
vim.keymap.set("n", "<leader>ft", builtin.treesitter, { desc = "Find treesitter symbols" })
vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
