local parsers = {
  "bash", "c", "c_sharp", "cpp", "css", "diff", "gitcommit", "go", "gomod", "gosum",
  "html", "java", "javascript", "json", "lua", "luadoc", "markdown", "markdown_inline",
  "python", "query", "regex", "rust", "toml", "tsx", "typescript", "vim", "vimdoc", "yaml",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false, -- the main branch does not support lazy-loading
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install(parsers)

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
        callback = function(args)
          if not pcall(vim.treesitter.start, args.buf) then
            return -- no parser for this filetype
          end
          vim.wo.foldmethod = "expr"
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.wo.foldlevel = 99
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },

  -- Queries used by mini.ai for function/class/block text objects
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    lazy = true,
  },
}
