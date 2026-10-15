-- jdtls needs a separate workspace directory per project, so it is started here
-- instead of through vim.lsp.enable().
local function start_jdtls()
  if vim.fn.executable("jdtls") == 0 then
    vim.notify("jdtls not installed yet (see :Mason)", vim.log.levels.WARN)
    return
  end

  local root = vim.fs.root(0, { "gradlew", "mvnw", "pom.xml", "build.gradle", "build.gradle.kts", ".git" })
  if not root then
    root = vim.fn.getcwd()
  end

  local workspace = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(root, ":t")

  -- Debug and test bundles installed by Mason (java-debug-adapter, java-test)
  local packages = vim.fn.stdpath("data") .. "/mason/packages"
  local bundles = vim.fn.glob(
    packages .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
    true,
    true
  )
  vim.list_extend(bundles, vim.fn.glob(packages .. "/java-test/extension/server/*.jar", true, true))

  require("jdtls").start_or_attach({
    cmd = { vim.fn.exepath("jdtls"), "-data", workspace },
    root_dir = root,
    init_options = { bundles = bundles },
    capabilities = require("blink.cmp").get_lsp_capabilities(),
    settings = {
      java = {
        inlayHints = { parameterNames = { enabled = "all" } },
      },
    },
  })
end

return {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("user_jdtls", { clear = true }),
      pattern = "java",
      callback = start_jdtls,
    })
    -- The buffer that triggered lazy-loading already fired FileType
    if vim.bo.filetype == "java" then
      start_jdtls()
    end
  end,
}
