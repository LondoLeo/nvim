return {
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            local gitsigns = require('gitsigns')
            gitsigns.setup({
                current_line_blame = true,
                current_line_blame_opts = {
                    delay = 200,
                }
            })
            vim.keymap.set("n", "mp", gitsigns.preview_hunk_inline, { desc = "Preview Hunk" })
            vim.keymap.set("n", "]g", function() gitsigns.nav_hunk("next", { wrap = true, preview = true }) end,
                { desc = "Next Hunk" })
            vim.keymap.set("n", "[g", function() gitsigns.nav_hunk("prev", { wrap = true, preview = true }) end,
                { desc = "Previous Hunk" })
            vim.keymap.set("n", "ms", gitsigns.stage_hunk, { desc = "Stage Hunk" })
            vim.keymap.set("n", "mr", gitsigns.reset_hunk, { desc = "Reset Hunk" })
            vim.keymap.set("n", "mb", gitsigns.stage_buffer, { desc = "Stage Buffer" })
        end
    },
}
