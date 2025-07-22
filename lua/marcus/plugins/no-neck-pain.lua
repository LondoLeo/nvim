return {
    {
        "shortcuts/no-neck-pain.nvim",
        version = "*",
        config = function ()
            local nnp = require("no-neck-pain")
            nnp.setup{
                width = 125
            }
            vim.keymap.set("n", "<leader>o", nnp.toggle)
        end
    }
}
