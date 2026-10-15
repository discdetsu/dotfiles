return {
  "sainnhe/everforest",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.everforest_background = "hard"
    vim.g.everforest_enable_italic = 1
    vim.g.everforest_better_performance = 1
    -- Don't paint a background; Ghostty's background-opacity/blur shows through.
    -- 2 also clears the statusline, tabline and float backgrounds.
    vim.g.everforest_transparent_background = 2

    vim.api.nvim_create_autocmd("ColorScheme", {
      group = vim.api.nvim_create_augroup("user_everforest", { clear = true }),
      pattern = "everforest",
      callback = function()
        vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { link = "Green" })
        -- Transparent floats too (pickers, hover docs, completion menu)
        for _, group in ipairs({ "NormalFloat", "FloatBorder", "FloatTitle" }) do
          local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
          hl.bg = nil
          vim.api.nvim_set_hl(0, group, hl)
        end
      end,
    })

    vim.cmd.colorscheme("everforest")
  end,
}
