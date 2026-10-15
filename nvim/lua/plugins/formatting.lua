return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cf",
      function() require("conform").format({ async = true }) end,
      mode = { "n", "x" },
      desc = "Format",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_organize_imports", "ruff_format" },
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      html = { "prettierd" },
      css = { "prettierd" },
      scss = { "prettierd" },
      json = { "prettierd" },
      jsonc = { "prettierd" },
      yaml = { "prettierd" },
      markdown = { "prettierd" },
      go = { "goimports", "gofumpt" },
      rust = { "rustfmt", lsp_format = "fallback" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      java = { "google-java-format" },
      cs = { "csharpier" },
    },
    default_format_opts = { lsp_format = "fallback" },
    format_on_save = function(buf)
      if vim.g.disable_autoformat or vim.b[buf].disable_autoformat then
        return
      end
      return { timeout_ms = 1000 }
    end,
  },
  init = function()
    -- :FormatToggle (global) / :FormatToggle! (buffer only)
    vim.api.nvim_create_user_command("FormatToggle", function(args)
      if args.bang then
        vim.b.disable_autoformat = not vim.b.disable_autoformat
      else
        vim.g.disable_autoformat = not vim.g.disable_autoformat
      end
    end, { bang = true, desc = "Toggle format on save" })
  end,
}
