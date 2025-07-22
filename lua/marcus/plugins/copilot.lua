return {
    {
        "github/copilot.vim",
        config = function()
            vim.cmd("silent! Copilot disable")
            vim.g.copilot_enabled = false
            vim.keymap.set("n", "<leader>c", function()
                if vim.g.copilot_enabled then
                    vim.cmd("Copilot disable")
                    vim.g.copilot_enabled = false
                    vim.cmd("Copilot status")
                else
                    vim.cmd("Copilot enable")
                    vim.g.copilot_enabled = true
                    vim.cmd("Copilot status")
                end
            end, { desc = "Toggle Copilot" })
        end
    }
}
