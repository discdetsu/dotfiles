-- Merged on top of nvim-lspconfig's defaults (after/ wins over plugin lsp/ files)
return {
  settings = {
    Lua = {
      completion = { callSnippet = "Replace" },
      hint = { enable = true },
      workspace = { checkThirdParty = false },
    },
  },
}
