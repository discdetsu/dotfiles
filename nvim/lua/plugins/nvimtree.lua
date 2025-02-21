return { 
    "nvim-tree/nvim-tree.lua", 
    dependencies = { 
        "nvim-tree/nvim-web-devicons" 
    },
    config = function()
        require("nvim-tree").setup({
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
            view = {
                width = 30,
                side = "left",
            },
        })
    end
}
