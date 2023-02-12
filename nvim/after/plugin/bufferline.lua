require("bufferline").setup{
    options = {
        buffer_close_icon = "",
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = true,
        show_tab_indicators = true,
        diagnostics_indicator = function(count)
            return "(!"..count..")"
        end,
    }
}
