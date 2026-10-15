local header =
  [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⢿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠛⠙⠛⠋⠙⠿⢿⡿⠿⠁⠀⠀⠀⠀⠀⠈⠙⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⠀⠀⠀⠀⠀⠀⠉⠙⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⠙⠋⠀⠀⠂⠀⠀⠀⠀⠄⠀⠀⠀⠀⠤⠉⠛⠶⣄⣠⣤⣤⠀⠀⠀⠀⠀⠀⠀⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⠟⠃⠀⠀⠀⢀⣀⠀⠀⠀⠀⣐⠶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⣽⡯⡭⠄⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣏⠀⠀⠀⠀⠀⠀⠤⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠠⠄⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠴⠆⠀⠀⠀⠀⠀⠀⠉⠈⠉⠀⠀⠀⠄⠀⠀⠀⠙⠿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⡿⠿⠓⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠀⠀⠀⠁⠀⠀⠀⠀⠸⢿⣿⣿⣿⣿
⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠴⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠀⠀⠀⠀⠀⠺⢿⣿⣿⣿
⣿⠿⠿⠛⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⣿⣿
⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣹
⣆⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡤⠓⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈
⣿⣿⣿⡆⣠⡤⠀⠆⡀⠀⣀⠓⠄⢴⡆⠀⠀⠀⠀⠀⠀⠀⢴⡀⠀⢦⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⠀⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣶⣾
⣿⣿⣿⣿⣿⣷⣶⣿⣿⣶⣿⣿⣷⣶⣤⣄⡀⢀⣤⣤⣴⣦⣄⡁⠀⠀⠀⡶⠀⢰⣿⣶⣴⣿⣿⣿⣦⠈⠁⠀⢀⣠⡀⠀⢀⣄⣀⢀⣠⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⡄⠀⠈⢀⣴⣿⣿⣿⣿⣿⣿⣿⣷⣤⣤⣤⣼⣿⣿⣷⣾⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠿⠛⠁⠀⠀⠙⠻⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]]

return {
  -- QoL collection: dashboard, notifier, picker, explorer, indent guides, ...
  {
    "folke/snacks.nvim",
    lazy = false,
    priority = 900,
    opts = {
      bigfile = { enabled = true },
      quickfile = { enabled = true },
      dashboard = {
        enabled = true,
        preset = { header = header },
      },
      explorer = { enabled = true, replace_netrw = false }, -- oil handles directory buffers
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      picker = {
        enabled = true,
        sources = {
          explorer = {
            layout = { layout = { position = "left", width = 32 } },
            hidden = true, -- show dotfiles
          },
        },
      },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
    keys = {
      -- Explorer
      {
        "<leader>e",
        function()
          Snacks.explorer()
        end,
        desc = "File explorer",
      },
      {
        "<leader>E",
        function()
          Snacks.explorer.reveal()
        end,
        desc = "Reveal file in explorer",
      },
      -- Find
      {
        "<leader><space>",
        function()
          Snacks.picker.smart()
        end,
        desc = "Smart find files",
      },
      {
        "<leader>/",
        function()
          Snacks.picker.grep()
        end,
        desc = "Grep",
      },
      {
        "<leader>ff",
        function()
          Snacks.picker.files()
        end,
        desc = "Find files",
      },
      {
        "<leader>fg",
        function()
          Snacks.picker.grep()
        end,
        desc = "Grep",
      },
      {
        "<leader>fb",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Buffers",
      },
      {
        "<leader>fr",
        function()
          Snacks.picker.recent()
        end,
        desc = "Recent files",
      },
      {
        "<leader>fh",
        function()
          Snacks.picker.help()
        end,
        desc = "Help pages",
      },
      {
        "<leader>fk",
        function()
          Snacks.picker.keymaps()
        end,
        desc = "Keymaps",
      },
      {
        "<leader>fw",
        function()
          Snacks.picker.grep_word()
        end,
        desc = "Grep word",
        mode = { "n", "x" },
      },
      {
        "<leader>fd",
        function()
          Snacks.picker.diagnostics()
        end,
        desc = "Diagnostics",
      },
      {
        "<leader>fs",
        function()
          Snacks.picker.lsp_symbols()
        end,
        desc = "LSP symbols",
      },
      {
        "<leader>fc",
        function()
          Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "Config files",
      },
      {
        "<leader>fn",
        function()
          Snacks.picker.notifications()
        end,
        desc = "Notification history",
      },
      -- Git
      {
        "<leader>gg",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
      {
        "<leader>gl",
        function()
          Snacks.picker.git_log()
        end,
        desc = "Git log",
      },
      {
        "<leader>gS",
        function()
          Snacks.picker.git_status()
        end,
        desc = "Git status",
      },
      -- Buffers
      {
        "<leader>bd",
        function()
          Snacks.bufdelete()
        end,
        desc = "Delete buffer",
      },
      {
        "<leader>bo",
        function()
          Snacks.bufdelete.other()
        end,
        desc = "Delete other buffers",
      },
      -- Misc
      {
        "<leader>un",
        function()
          Snacks.notifier.hide()
        end,
        desc = "Dismiss notifications",
      },
      {
        "<C-/>",
        function()
          Snacks.terminal()
        end,
        desc = "Terminal",
        mode = { "n", "t" },
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "everforest",
        globalstatus = true,
        component_separators = "",
        section_separators = { left = "", right = "" },
        disabled_filetypes = { statusline = { "snacks_dashboard" } },
      },
    },
  },

  -- Open buffers as tabs across the top
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
      { "<A-,>", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer left" },
      { "<A-.>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer right" },
      { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Pin buffer" },
      { "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "Close unpinned buffers" },
      { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Pick buffer" },
      { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close buffers to the left" },
      { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Close buffers to the right" },
    },
    opts = {
      options = {
        close_command = function(n)
          Snacks.bufdelete(n)
        end,
        right_mouse_command = function(n)
          Snacks.bufdelete(n)
        end,
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
        -- No indicator bar, underline or dividers: the selected tab is just bold italic
        indicator = { style = "none" },
        separator_style = { "", "" },
        -- Start the tabs after the file tree instead of above it
        offsets = {
          { filetype = "snacks_layout_box", text = "Explorer", highlight = "Directory", separator = false },
        },
      },
      highlights = {
        buffer_selected = { bold = true, italic = true },
      },
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>?",
        function()
          -- which-key finishes setup on the next tick; wait for it if this key loaded the plugin
          vim.schedule(function()
            require("which-key").show({ global = false })
          end)
        end,
        desc = "Buffer keymaps",
      },
    },
    opts = {
      preset = "modern",
      spec = {
        { "<leader>b", group = "buffer" },
        { "<leader>c", group = "code" },
        { "<leader>d", group = "debug" },
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>u", group = "ui" },
        { "<leader>x", group = "diagnostics" },
        { "gs", group = "surround" },
      },
    },
  },

  -- Smooth scrolling. <C-b> is left to tmux (prefix), so full-page scroll is on <PageUp>/<PageDown>.
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<PageUp>",
        function()
          require("neoscroll").ctrl_b({ duration = 450 })
        end,
        mode = { "n", "v", "x" },
        desc = "Page up",
      },
      {
        "<PageDown>",
        function()
          require("neoscroll").ctrl_f({ duration = 450 })
        end,
        mode = { "n", "v", "x" },
        desc = "Page down",
      },
    },
    opts = {
      mappings = { "<C-u>", "<C-d>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
      easing = "quadratic",
      duration_multiplier = 1.0,
      hide_cursor = true,
      stop_eof = true,
    },
  },

  -- Cursor animation
  {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",
    opts = {
      stiffness = 0.8,
      trailing_stiffness = 0.5,
      distance_stop_animating = 0.5,
    },
  },
}
