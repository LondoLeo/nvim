return {
    { 
        'akinsho/toggleterm.nvim', 
        version = "*", 
        config = function()
            require("toggleterm").setup{
                open_mapping = [[<c-t>]],
                size = 24,
                direction = 'float',
                persist_size = true,
                start_in_insert = true,
                insert_mappings = true,
                terminal_mappings = true,
                auto_scroll = true,
                float_opts = {
                    border = 'curved', 
                    width = 96,
                    height = 48,
                }
            }
        end
    },
}
