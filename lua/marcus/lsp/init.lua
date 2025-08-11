vim.keymap.del("n", "grn")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gri")

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<leader>k", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>v", vim.lsp.buf.code_action)

-- Autocomplete

-- Open Menu even when there's only one option, no menu item is preselected, show extra information in a popup
vim.opt.completeopt = { "menuone", "noselect", "popup" }

-- LSP Servers
vim.lsp.enable({ "gopls", "pyright", "intelephense", "lua_ls", "tinymist", "clangd", "bash-language-server", "html-lsp" })

vim.lsp.config("gopls", {
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
})
vim.lsp.config("pyright", {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
})
vim.lsp.config("intelephense", {
    settings = {
        intelephense = {
            stubs = { "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype", "curl", "date", "dom",
                "enchant", "exif", "FFI", "fileinfo", "filter", "ftp", "gd", "gettext", "gmp", "hash", "iconv", "imap",
                "intl", "json", "ldap", "libxml", "mbstring", "mysqli", "mysqlnd", "odbc", "openssl", "pcntl", "pcre",
                "PDO", "pdo_mysql", "pdo_pgsql", "pgsql", "Phar", "posix", "pspell", "readline", "redis", "Reflection",
                "session", "shmop", "SimpleXML", "snmp", "soap", "sockets", "sodium", "SPL", "sqlite3", "standard",
                "superglobals",
                -- 'sybase_ct', 'sysvmsg', 'sysvsem', 'sysvshm',
                -- 'tidy', 'tokenizer', 'xml', 'xmlreader', 'xmlrpc',
                -- 'xmlwriter', 'xsl', 'Zend OPcache', 'zip', 'zlib'
            },
            environment = {
                includePaths = { "/usr/local/lib/php" },
            },
        },
    },
})
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
})

vim.lsp.config("tinymist", {
    settings = {
        tinymist = {
            enable = true,
            log_level = "debug",
        },
    },
})
vim.lsp.config("arduino-language-server", {
    settings = {
        arduino = {
            enable = true,
            log_level = "debug",
            board_manager = {
                additional_urls = "https://downloads.arduino.cc/packages/package_arduino.cc_index.json",
            },
            library_manager = {
                additional_urls = "https://downloads.arduino.cc/libraries/library_index.json",

            },
            cmd = { "arduino-language-server", "-cli-config", "$HOME/.arduinoIDE/arduino-cli.yaml", "-clangd", "/usr/bin/clangd" }
        },
    },
})
vim.lsp.config("clangd", {
    settings = {
        clangd = {
            enable = true,
            log_level = "debug",
            filetypes = { "c", "cpp", "objc", "objcpp", "arduino" },
            cmd = { "clangd", "--background-index" },
            semanticHighlighting = true,
        },
    },
})
