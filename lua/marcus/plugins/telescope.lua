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
            local builtin = require("telescope.builtin")
            local actions = require("telescope.actions")
            local action_state = require "telescope.actions.state"
            local finders = require "telescope.finders"
            local pickers = require "telescope.pickers"
            local config = require "telescope.config".values
            local previewers = require "telescope.previewers"
            vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = "Find Files" })
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
            -- vim.keymap.set({ "n", "i" }, "<C-s>", function()
            --     local ft = vim.bo.filetype
            --     local snippets = require "luasnip".get_snippets(ft)
            --     if not snippets or vim.tbl_isempty(snippets) then
            --         vim.notify("No snippets available for " .. ft, vim.log.levels.WARN)
            --         return
            --     end
            --     pickers.new({}, {
            --         prompt_title = "Snippets (" .. ft .. ")",
            --         finder = finders.new_table {
            --             results = snippets,
            --             entry_maker = function(snippet)
            --                 return {
            --                     value = snippet,
            --                     display = snippet.trigger or "[no trigger]",
            --                     ordinal = snippet.trigger or "",
            --                 }
            --             end,
            --         },
            --         previewer = previewers.new_buffer_previewer {
            --             define_preview = function(self, entry, _)
            --                 local snippet = entry.value
            --                 local body = snippet._snippet_string
            --
            --                 vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, vim.split(body, "\n"))
            --             end,
            --         },
            --         sorter = config.generic_sorter({}),
            --         attach_mappings = function(prompt_bufnr, _)
            --             actions.select_default:replace(function()
            --                 actions.close(prompt_bufnr)
            --                 local selection = action_state.get_selected_entry()
            --                 if selection and selection.value then
            --                     require "luasnip".snip_expand(selection.value)
            --                 else
            --                     vim.notify("No snippet selected", vim.log.levels.WARN)
            --                 end
            --             end)
            --             return true
            --         end,
            --     }):find()
            -- end, { desc = "Available Snippets" })
        end
    },
}
