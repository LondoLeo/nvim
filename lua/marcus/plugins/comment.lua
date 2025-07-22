return {
    {
        'numToStr/Comment.nvim',
        config = function()
            require("Comment").setup {
                toggler = {
                    line = '<leader>a',
                    block = '<leader>A',
                },
                opleader = {
                    line = '<leader>a',
                    block = '<leader>A'
                },
                mappings = {
                    basic = true,
                    extra = false
                }
            }
        end
    },
}
