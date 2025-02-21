return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require("telescope").setup({
            defaults = {
                file_ignore_patterns = {
                    "node_modules",
                    ".git/",
                    ".cache",
                    "%.o",
                    "%.a",
                    "%.out",
                    "%.class",
                    "%.pdf",
                    "%.mkv",
                    "%.mp4",
                    "%.zip"
                },
               -- initial_mode = "insert",
               -- selection_strategy = "reset",
               -- sorting_strategy = "ascending",
               -- layout_strategy = "horizontal",
               -- layout_config = {
               --     horizontal = {
               --         prompt_position = "top",
               --         preview_width = 0.55,
               --         results_width = 0.8,
               --     },
               --     vertical = {
               --         mirror = false,
               --     },
               --     width = 0.87,
               --     height = 0.80,
               --     preview_cutoff = 120,
               -- },
               -- path_display = { "truncate" },
               winblend = 0,
               border = true,
               -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
               -- color_devicons = true,
               -- set_env = { ["COLORTERM"] = "truecolor" },
            },
           -- pickers = {
           --     find_files = {
           --         theme = "dropdown",
           --         previewer = false,
           --         hidden = true,
           --     },
           --     live_grep = {
           --         theme = "dropdown",
           --     },
           --     buffers = {
           --         theme = "dropdown",
           --         previewer = false,
           --         initial_mode = "normal",
           --     },
           -- },
           -- extensions = {
           --     file_browser = {
           --         theme = "dropdown",
           --         hijack_netrw = true,
           --     },
           -- },
        })
    end
}

