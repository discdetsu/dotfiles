return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require('kanagawa').setup({
            compile = false,             -- enable compiling the colorscheme
            undercurl = true,            -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true},
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = true,         -- do not set background color
            dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
            terminalColors = true,       -- define vim.g.terminal_color_{0,17}
            colors = {                   -- add/modify theme and palette colors
                palette = {},
                theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
            },
            overrides = function(colors) -- add/modify highlights
                return {
                }
            end,
            theme = "dragon",              -- Load "wave" theme when 'background' option is not set
            background = {               -- map the value of 'background' option to a theme
                dark = "dragon",           -- try "dragon" !
                light = "lotus"
            },
        })

        -- setup must be called before loading
        vim.cmd("colorscheme kanagawa")
        vim.cmd("highlight clear LineNr") -- Clear LineNr background

        -- override telescope theme
        vim.cmd("highlight TelescopeNormal guibg=#1f1f28")
        vim.cmd("highlight TelescopeBorder guibg=#1f1f28 guifg=#1f1f28")
        vim.cmd("highlight TelescopePromptNormal guibg=#1f1f28")
        vim.cmd("highlight TelescopePromptBorder guibg=#1f1f28 guifg=#1f1f28")
        vim.cmd("highlight TelescopeResultsNormal guibg=#1f1f28")
        vim.cmd("highlight TelescopeResultsBorder guibg=#1f1f28 guifg=#1f1f28")
        vim.cmd("highlight TelescopePreviewNormal guibg=#1f1f28")
        vim.cmd("highlight TelescopePreviewBorder guibg=#1f1f28 guifg=#1f1f28")

    end,
}
