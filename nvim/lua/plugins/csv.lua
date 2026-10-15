return {
  "hat0uma/csvview.nvim",
  ft = { "csv", "tsv" },
  cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
  opts = {
    parser = { comments = { "#", "//" } },
    view = { display_mode = "border" },
    keymaps = {
      -- Text objects for fields, and Tab/Shift-Tab to hop between them
      textobject_field_inner = { "if", mode = { "o", "x" } },
      textobject_field_outer = { "af", mode = { "o", "x" } },
      jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
      jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
    },
  },
  config = function(_, opts)
    require("csvview").setup(opts)

    local function enable(buf)
      vim.api.nvim_buf_call(buf, function()
        vim.cmd("CsvViewEnable")
      end)
    end

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("user_csvview", { clear = true }),
      pattern = { "csv", "tsv" },
      callback = function(args)
        enable(args.buf)
      end,
    })

    -- The buffer that triggered lazy-loading already fired FileType
    local buf = vim.api.nvim_get_current_buf()
    if vim.tbl_contains({ "csv", "tsv" }, vim.bo[buf].filetype) then
      enable(buf)
    end
  end,
}
