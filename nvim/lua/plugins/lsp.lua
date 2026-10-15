local has = function(bin)
  return vim.fn.executable(bin) == 1
end

-- LSP servers (lspconfig names), installed by mason-lspconfig and enabled automatically
local servers = {
  "lua_ls",
  "basedpyright",
  "ruff",
  "vtsls",
  "eslint",
  "html",
  "cssls",
  "jsonls",
  "clangd",
  "jdtls", -- started by nvim-jdtls, see plugins/lang/java.lua
}
if has("go") then
  table.insert(servers, "gopls")
end

-- Formatters, linters, debuggers and servers managed by language plugins (Mason package names)
local tools = {
  "stylua",
  "prettierd",
  "clang-format",
  "google-java-format",
  "rust-analyzer", -- used by rustaceanvim
  "debugpy",
  "codelldb",
  "js-debug-adapter",
  "java-debug-adapter",
  "java-test",
}
if has("go") then
  vim.list_extend(tools, { "gofumpt", "goimports", "golangci-lint", "delve" })
end
if has("dotnet") then
  vim.list_extend(tools, { "roslyn", "csharpier", "netcoredbg" })
end

return {
  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate", "MasonLog" },
    build = ":MasonUpdate",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry", -- provides the `roslyn` package
      },
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = "VeryLazy",
    dependencies = { "mason-org/mason.nvim" },
    opts = { ensure_installed = tools },
    config = function(_, opts)
      require("mason-tool-installer").setup(opts)
      -- run_on_start hooks VimEnter, which already fired when lazy-loaded
      vim.cmd("MasonToolsInstall")
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "b0o/SchemaStore.nvim",
    },
    config = function()
      -- Servers that need settings from Lua modules; static overrides live in after/lsp/*.lua
      vim.lsp.config("jsonls", {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_enable = {
          -- Started by dedicated plugins instead
          exclude = { "jdtls", "rust_analyzer", "roslyn_ls", "stylua" }, -- stylua runs via conform
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
        callback = function(args)
          local function map(lhs, rhs, desc, mode)
            vim.keymap.set(mode or "n", lhs, rhs, { buffer = args.buf, desc = desc })
          end

          -- Built-in defaults also apply: K, grn, gra, grr, gri, grt, gO, [d, ]d
          map("gd", function() Snacks.picker.lsp_definitions() end, "Goto definition")
          map("gD", vim.lsp.buf.declaration, "Goto declaration")
          map("grr", function() Snacks.picker.lsp_references() end, "References")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action", { "n", "x" })
          map("<leader>cr", vim.lsp.buf.rename, "Rename")
          map("<leader>ch", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }), { bufnr = args.buf })
          end, "Toggle inlay hints")
        end,
      })
    end,
  },

  -- Neovim runtime/plugin types for lua_ls when editing this config
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "snacks.nvim", words = { "Snacks" } },
      },
    },
  },
}
