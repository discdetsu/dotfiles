-- Linters not already covered by an LSP (ruff, eslint, clangd and rust-analyzer lint via LSP)
return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufNewFile", "BufWritePost" },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      go = { "golangcilint" },
    }

    vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("user_lint", { clear = true }),
      callback = function()
        -- Only run linters whose executable is installed
        local names = vim.tbl_filter(function(name)
          local linter = lint.linters[name]
          local cmd = type(linter) == "table" and linter.cmd or nil
          if type(cmd) == "function" then
            cmd = cmd()
          end
          return cmd ~= nil and vim.fn.executable(cmd) == 1
        end, lint.linters_by_ft[vim.bo.filetype] or {})
        if #names > 0 then
          lint.try_lint(names)
        end
      end,
    })
  end,
}
