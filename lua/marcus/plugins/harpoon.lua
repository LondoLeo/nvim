return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon.setup {}
            vim.keymap.set("n", "<leader>h", function()
                harpoon:list():add()
                print("Buffer added to Harpoon")
            end)
            vim.keymap.set("n", "<leader>q", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end)

            vim.keymap.set("n", "<C-q>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-w>", function() harpoon:list():select(2) end, { nowait = true })
            vim.keymap.set("n", "<C-f>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<C-p>", function() harpoon:list():select(4) end)
            vim.keymap.set("n", "<C-b>", function() harpoon:list():select(5) end)
        end
    }
}
