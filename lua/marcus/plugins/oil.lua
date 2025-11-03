return {
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
        config = function()
            local oil = require("oil")
            oil.setup {
                columns = { "icon" },
                keymaps = {
                    ["<C-h>"] = false,
                    ["<C-l>"] = false,
                    ["<C-t>"] = false,
                    ["<C-s>"] = function() oil.select({ vertical = true, split = "belowright" }) end,
                    ["<Esc>"] = "actions.close"
                },
                view_options = {
                    show_hidden = true
                },
                float = {
                    max_width = 0.5,
                    max_height = 0.8
                },
                delete_to_trash = true,
            }
            vim.keymap.set('n', '<leader>f', oil.open_float, { desc = "Open Oil" })
        end
    },
}
