local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.hl.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

vim.api.nvim_create_augroup("AutoFormat", {})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = "*",
    callback = function()
        if vim.bo.filetype == "c" then
            return
        end
        vim.lsp.buf.format()
    end
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufNew" }, {
    pattern = "*.typ",
    callback = function()
        vim.opt_local.tw = 90
    end
})


vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = "*.go",
    callback = function()
        local params = vim.lsp.util.make_range_params()
        params.context = { only = { "source.organizeImports" } }
        local timeout = 3000
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout)
        for cid, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
                if r.edit then
                    local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                    vim.lsp.util.apply_workspace_edit(r.edit, enc)
                end
            end
        end
        vim.lsp.buf.format({ async = false })
    end
})

vim.api.nvim_create_autocmd({ "ColorScheme", 'BufEnter' }, {
    callback = function()
        local normal = vim.api.nvim_get_hl_by_name('Normal', true)
        local bg = string.format("#%06x", normal["background"])
        os.execute(string.format("tmux set-option -t \"$(tmux display-message -p '#S')\" window-style \"bg=%s\"", bg))
    end
})
