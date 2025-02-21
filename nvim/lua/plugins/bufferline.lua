return {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    version = "*",
    opts = {
        options = {
            -- numbers = "ordinal", -- Show buffer numbers
            diagnostics = "nvim_lsp", -- Show LSP diagnostics in buffers
            separator_style = "bar", -- Makes it look sleek
            offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center" } },
            show_buffer_close_icons = true, -- Hide close icons
            show_close_icon = true, -- Hide global close icon
            always_show_bufferline = true, -- Always show bufferline
            hover = {
                enabled = true,
                delay = 150,
                reveal = {'close'}
            },
            close_icon = "",
            buffer_close_icon = "",

        }
    }
}
