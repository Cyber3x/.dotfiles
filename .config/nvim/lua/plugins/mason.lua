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
          }
        end,
  },
}
