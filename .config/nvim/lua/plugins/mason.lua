return {
    -- Mason: installs and manages external tools like LSP servers
    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    },

    -- mason-LSPConfig: tells Mason which servers to install and links them to lspconfig
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
                "rust_analyzer"
            },
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },

    -- nvim-lspconfig: connects Neovim to installed LSP servers
    {
        "neovim/nvim-lspconfig",
        dependencies = { "hrsh7th/cmp-nvim-lsp" }, -- for completion capabilities
        config = function()
            local lspconfig = require("lspconfig")

            -- Get completion capabilities from nvim-cmp
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Lua LSP (great for editing Neovim configs)
            lspconfig.lua_ls.setup {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim" } }, -- recognize `vim` global
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = { enable = false },
                    },
                },
            }

            -- Rust LSP (basic setup for now)
            lspconfig.rust_analyzer.setup {
                capabilities = capabilities,
                settings = {
                    ["rust_analyzer"] = {
                        rustfmt = {
                            overrideCommand = {
                                "rustup", "run", "nightly", "rustfmt", "--config-path", "/home/nlukic/programming/tbtl/mono/projects/eudi/rustfmt.toml"
                            }
                        },
                        checkOnSave = { command = "clippy" },
                    }
                },
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = bufnr,
                            callback = function() vim.lsp.buf.format({ async = false }) end
                        })
                    end
                end,
                flags = { debounce_text_changes = 150 }, -- reduce cpu usage
            }

            -- Set up some useful keybinds for LSP features
            -- These will only work when you're in a file with an active LSP
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to Definition' })
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Show Documentation' })
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename Symbol' })
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Actions' })
        end,
    },
}
