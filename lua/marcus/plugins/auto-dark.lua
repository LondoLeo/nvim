return {
    {
        "f-person/auto-dark-mode.nvim",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            set_dark_mode = function()
                -- vim.api.nvim_set_option_value("background", "dark", {})
                vim.cmd.colorscheme("monokai-pro")
            end,
            set_light_mode = function()
                -- vim.api.nvim_set_option_value("background", "light", {})

                vim.cmd.colorscheme("monokai-pro-light")
            end,
            update_interval = 10000,
            fallback = "light" -- refer to the configuration section below
        }
    }
}
