local inlay_hints = {
  parameterNames = { enabled = "literals" },
  parameterTypes = { enabled = true },
  variableTypes = { enabled = false },
  propertyDeclarationTypes = { enabled = true },
  functionLikeReturnTypes = { enabled = true },
  enumMemberValues = { enabled = true },
}

return {
  settings = {
    vtsls = { autoUseWorkspaceTsdk = true },
    typescript = { inlayHints = inlay_hints, updateImportsOnFileMove = { enabled = "always" } },
    javascript = { inlayHints = inlay_hints, updateImportsOnFileMove = { enabled = "always" } },
  },
}
