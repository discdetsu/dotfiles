-- Wraps rust-analyzer (from Mason or rustup); also configures codelldb debugging.
-- Commands: :RustLsp runnables / debuggables / expandMacro / explainError ...
return {
  "mrcjkb/rustaceanvim",
  lazy = false, -- the plugin lazy-loads itself on rust files
  init = function()
    vim.g.rustaceanvim = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            check = { command = "clippy" },
            cargo = { allFeatures = true },
          },
        },
      },
    }
  end,
}
