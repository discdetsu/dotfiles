return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua", "c", "cpp", "python", "json", "bash", "javascript", "html", "css", "yaml", "toml", "rust" }, -- Add more languages if needed
            sync_install = false, -- Install parsers asynchronously
            auto_install = true,  -- Automatically install missing parsers
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
        })
    end
}
