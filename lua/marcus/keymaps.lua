vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set("n", "U", vim.cmd.redo)


vim.keymap.set("n", "<leader>wh", vim.cmd.vsplit, { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>wl", function()
    vim.cmd.vsplit()
    vim.cmd.wincmd("l")
end, { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>wj", function()
    vim.cmd.split()
    vim.cmd.wincmd("j")
end, { desc = "Split window downwards" })
vim.keymap.set("n", "<leader>wk", vim.cmd.split, { desc = "Split window upwards" })

vim.keymap.set("n", "<leader>wwh", function() vim.cmd.wincmd("H") end, { desc = "Move window left" })
vim.keymap.set("n", "<leader>wwj", function() vim.cmd.wincmd("J") end, { desc = "Move window down" })
vim.keymap.set("n", "<leader>wwk", function() vim.cmd.wincmd("K") end, { desc = "Move window up" })
vim.keymap.set("n", "<leader>wwl", function() vim.cmd.wincmd("L") end, { desc = "Move window right" })

vim.keymap.set("n", "<C-Down>", "5<C-W>-")
vim.keymap.set("n", "<C-Up>", "5<C-W>+")
vim.keymap.set("n", "<C-Left>", "5<C-W><")
vim.keymap.set("n", "<C-Right>", "5<C-W>>")
vim.keymap.set("n", "<C-0>", "<C-W>=")

vim.keymap.set("n", "<C-F>", "<C-U>")
vim.keymap.set("n", "<C-P>", "<C-D>")

vim.keymap.set("n", "<C-L>", "<C-I>")
vim.opt.langmap = "nj,jn,NJ,JN,ek,ke,EK,KE,mh,hm,MH,HM,il,li,IL,LI"
vim.opt.langremap = false

vim.keymap.set({ "n", "v" }, "gh", "^", { desc = "Go to start of line" })
vim.keymap.set({ "n", "v" }, "ge", "0", { desc = "Go to first character of line" })
vim.keymap.set({ "n" }, "gl", "$", { desc = "Go to end of line" })
vim.keymap.set({ "v" }, "gl", "$h", { desc = "Go to end of line" })
vim.keymap.set({ "n", "v" }, "gj", "G", { desc = "Go to end of file" })
vim.keymap.set({ "n", "v" }, "gk", "go", { desc = "Go to start of file" })

vim.keymap.set({ "n", "v" }, "s", ":s/", { noremap = true })


vim.keymap.set("n", "<C-y>",
    function()
        local path = vim.fn.expand("%")
        local f = io.open(path, "r")
        if f == nil or f == false then
            print("Cannot copy path: not a valid file")
            return
        end
        io.close(f)
        local line, _ = unpack(vim.api.nvim_win_get_cursor(0))
        vim.fn.setreg("+", string.format("%s:%d", path, line))
        print("Copied Path to Clipboard")
    end,
    { desc = "Yank current file path" })
