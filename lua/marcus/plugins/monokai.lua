return  {
    {
        'loctvl842/monokai-pro.nvim',
        config = function()
            require('monokai-pro').setup()
            vim.cmd.MonokaiPro 'pro'
        end
    }
}
