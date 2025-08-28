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
            },
            -- TODO: find out how to have some packages like spellcheckers auto enabled
            -- ensure_installed = {
            --  "cspell",
            --       "misspell",
            --      "codespell"
            -- },
            -- I thing ill have to use something like mason-tool-installer
        }
    },

    -- mason-LSPConfig: tells Mason which servers to install and links them to lspconfig
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
                -- "rust_analyzer",
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
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- One on_attach for all servers
            local on_attach = function(client, bufnr)
                local opts = function(desc)
                    return { buffer = bufnr, noremap = true, silent = true, desc = desc }
                end


                -- LSP navigation
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Go to Implementation")) -- Go to implementation
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("Show References"))          -- Show references

                -- hover and signature help
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = "single" }) end,
                    opts("Hover Documentation"))
                vim.keymap.set("n", "<C-k>", function() vim.lsp.buf.signature_help({ border = "single" }) end,
                    opts("Signature Help"))

                -- refactoring & code actions
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename Symbol"))
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code Action"))

                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        callback = function() vim.lsp.buf.format({ async = false }) end,
                    })
                end
            end

            -- Lua config
            lspconfig.lua_ls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = { enable = false },
                    },
                },
            }

            -- Rust analyzer setup
            lspconfig.rust_analyzer.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    ["rust-analyzer"] = {
                        rustfmt = {
                            overrideCommand = {
                                "rustup", "run", "nightly", "rustfmt",
                                "--config-path",
                                "/home/nlukic/programming/tbtl/mono/projects/eudi/rustfmt.toml",
                            },
                        },
                        checkOnSave = true,
                    },
                },
            }
        end,
    },
}
