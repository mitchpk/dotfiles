local status, cmp = pcall(require, "cmp")
if (not status) then return end

local luasnip = require("luasnip")
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.shortmess = vim.opt.shortmess + "c"
vim.opt.pumheight = 10

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    formatting = {
        fields = { "abbr", "kind" },
        format = function (_, vim_item)
            vim_item.menu = ""
            return vim_item
        end
    },
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    completion = {
        completeopt = 'menuone,noinsert'
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' }
    })
})

-- stop snippets when you leave to normal mode
vim.api.nvim_create_autocmd('ModeChanged', {
    callback = function()
        if
            ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
            and luasnip.session.current_nodes[vim.api.nvim_get_current_buf()]
            and not luasnip.session.jump_active
        then
            luasnip.unlink_current()
        end
    end
})
