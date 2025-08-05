return {
    {
        'numToStr/Comment.nvim',
        config = function()
            require("Comment").setup {
                toggler = {
                    line = '<leader>c',
                    block = '<leader>C',
                },
                opleader = {
                    line = '<leader>c',
                    block = '<leader>C'
                },
                mappings = {
                    basic = true,
                    extra = false
                }
            }
        end
    },
}
