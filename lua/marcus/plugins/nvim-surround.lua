return {
    {
        'kylechui/nvim-surround',
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup {
                keymaps = {
                    visual = '<leader>s',
                    visual_line = 'S',
                    normal = "<leader>s",
                    delete = '<leader>x',
                    change = '<leader>c'
                },
                aliases = {
                    ["a"] = ">",
                    ["b"] = ")",
                    ["B"] = "}",
                    ["r"] = "]",
                    ["q"] = { '"', "'", "`" },
                    ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
                },
            }
        end,
    },
}
