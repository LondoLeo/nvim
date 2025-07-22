return {
    {
        'nvim-telescope/telescope.nvim',
        version = '*',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("telescope").setup {
                defaults = {
                    mappings = {
                        i = {
                            ["<C-f>"] = function(prompt_bufnr)
                                local selection = require("telescope.actions.state").get_selected_entry()
                                local dir = vim.fn.fnamemodify(selection.path, ":p:h")
                                require("telescope.actions").close(prompt_bufnr)
                                vim.cmd(string.format("Oil %s", dir))
                            end,
                            ["<C-e>"] = "move_selection_previous",
                            ["<C-n>"] = "move_selection_next",
                            -- ["<esc>"] = require("telescope.actions").close
                        },
                        n = {
                            ["<C-f>"] = function(prompt_bufnr)
                                local selection = require("telescope.actions.state").get_selected_entry()
                                local dir = vim.fn.fnamemodify(selection.path, ":p:h")
                                require("telescope.actions").close(prompt_bufnr)
                                vim.cmd(string.format("Oil %s", dir))
                            end,
                            ["e"] = "move_selection_previous",
                            ["n"] = "move_selection_next",
                            ["<C-e>"] = "move_selection_previous",
                            ["<C-n>"] = "move_selection_next",
                        }
                    }
                },
                pickers = {
                    buffers = {
                        mappings = {
                            n = {
                                ["<C-x>"] = function(prompt_bufnr)
                                    local current = require("telescope.actions.state").get_current_picker(prompt_bufnr)
                                    current:delete_selection(
                                        function(selection)
                                            vim.api.nvim_buf_delete(selection.bufnr, { force = true })
                                        end
                                    )
                                end,
                            },
                            i = {
                                ["<C-x>"] = function(prompt_bufnr)
                                    local current = require("telescope.actions.state").get_current_picker(prompt_bufnr)
                                    current:delete_selection(
                                        function(selection)
                                            vim.api.nvim_buf_delete(selection.bufnr, { force = true })
                                        end
                                    )
                                end,
                            },
                        },
                    },
                },
            }
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>t', builtin.find_files, { desc = "Find Files" })
            vim.keymap.set('n', 'gs', function() builtin.lsp_document_symbols({ initial_mode = "insert" }) end,
                { desc = "List Symbols" })
            vim.keymap.set('n', 'gr', function() builtin.lsp_references({ initial_mode = "normal" }) end,
                { desc = "List References" })
            vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = "Live Grep" })
            vim.keymap.set('n', '<leader>b', function() builtin.buffers({ initial_mode = "insert" }) end,
                { desc = "List Buffers" })
            vim.keymap.set('n', 'gi', function() builtin.lsp_implementations({ initial_mode = "normal" }) end,
                { desc = "Goto Implementations" })
            vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Goto Definition" })
            vim.keymap.set('n', '<leader>d',
                function() builtin.diagnostics({ initial_mode = "normal", severity = vim.diagnostic.severity.ERROR }) end,
                { desc = "Show Diagnostics" })
            vim.keymap.set('n', '<leader>g', builtin.git_status, { desc = "Git Status" })
        end
    },
}
