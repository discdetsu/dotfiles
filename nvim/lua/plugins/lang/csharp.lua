-- Roslyn language server; the `roslyn` package comes from the Crashdummyy Mason registry
-- (added in plugins/lsp.lua) and is only installed when the dotnet SDK is present.
return {
  "seblyng/roslyn.nvim",
  ft = { "cs", "razor" },
  opts = {},
}
