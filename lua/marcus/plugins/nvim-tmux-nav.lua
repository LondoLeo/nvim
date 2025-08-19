return {
    'alexghergh/nvim-tmux-navigation',
    config = function()
        require 'nvim-tmux-navigation'.setup {
            keybindings = {
                left = "<C-m>",
                down = "<C-n>",
                up = "<C-e>",
                right = "<C-i>",
            }
        }
    end
}
