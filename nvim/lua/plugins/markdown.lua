-- Renders markdown (headings, tables, checkboxes, code blocks, callouts) inside the buffer
return {
  "OXY2DEV/markview.nvim",
  lazy = false, -- the plugin lazy-loads itself; lazy-loading it breaks the preview
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    preview = {
      -- Show the raw text on the cursor line in normal mode; insert mode shows raw text everywhere
      hybrid_modes = { "n" },
      linewise_hybrid_mode = true,
    },
  },
  keys = {
    { "<leader>um", "<cmd>Markview toggle<cr>", desc = "Toggle markdown preview" },
    { "<leader>uM", "<cmd>Markview splitToggle<cr>", desc = "Markdown preview in split" },
  },
}
