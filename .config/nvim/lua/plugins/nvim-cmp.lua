-- Minimal cmp.lua
return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
    },
    config = function()
        local cmp = require("cmp")

        cmp.setup({
            formatting = {
                format = function(entry, vim_item)
                    local max_width = 40
                    if #vim_item.abbr > max_width then
                        vim_item.abbr = string.sub(vim_item.abbr, 1, max_width) .. "..."
                    end
                    return vim_item
                end,
            },
            window = {
                completion = cmp.config.window.bordered({
                    border = "single",
                    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
                    col_offset = 0,
                    side_padding = 0,
                }),
                documentation = cmp.config.window.bordered({
                    border = "single",
                    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
                }),
            },
            experimental = {
                ghost_text = true,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(), -- close menu
                ["<CR>"] = cmp.mapping.confirm({ select = true }),

                -- suggestion navigation
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),

                -- docs
                ["<A-j>"] = cmp.mapping.scroll_docs(4),  -- scroll down in docs
                ["<A-k>"] = cmp.mapping.scroll_docs(-4), -- scroll up in docs
            }),
            sources = {
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
            },
        })
    end,
}
