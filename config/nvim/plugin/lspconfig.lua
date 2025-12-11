vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
            return
        end

        client.server_capabilities.semanticTokensProvider = nil
        if client.server_capabilities.completionProvider then
            vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
        end
        if client.server_capabilities.definitionProvider then
            vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
        end

        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', 'gR', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, bufopts)
        vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1,  float = true }) end, bufopts)
    end,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('lua_ls', {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },

            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            },
        },
    },
})
vim.lsp.enable('lua_ls')

vim.lsp.config('rust_analyzer', {
    capabilities = capabilities,
    settings = {
        ['rust-analyzer'] = {
            completion = {
                postfix = {
                    enable = false,
                },
            },
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "crate",
            },
        }
    }
})
vim.lsp.enable('rust_analyzer')

vim.lsp.config('ocamllsp', {
    capabilities = capabilities
})
vim.lsp.enable('ocamllsp')

vim.lsp.config('vue_ls', {
    capabilities = capabilities
})
vim.lsp.enable('vue_ls')

vim.lsp.config('ts_ls', {
    capabilities = capabilities
})
vim.lsp.enable('ts_ls')

vim.lsp.config('clangd', {
    capabilities = capabilities
})
vim.lsp.enable('clangd')

vim.lsp.config('gdscript', {
    capabilities = capabilities
})
vim.lsp.enable('gdscript')

vim.lsp.config('gopls', {
    capabilities = capabilities
})
vim.lsp.enable('gopls')

vim.lsp.config('pyright', {
    capabilities = capabilities
})
vim.lsp.enable('pyright')

vim.lsp.config('cssls', {
    capabilities = capabilities
})
vim.lsp.enable('cssls')

vim.lsp.config('svelte', {
    capabilities = capabilities
})
vim.lsp.enable('svelte')

vim.lsp.config('texlab', {
    capabilities = capabilities
})
vim.lsp.enable('texlab')

vim.lsp.config('jdtls', {
    capabilities = capabilities
})
vim.lsp.enable('jdtls')

vim.lsp.config('clojure_lsp', {
    capabilities = capabilities
})
vim.lsp.enable('clojure_lsp')

vim.lsp.config('hls', {
    capabilities = capabilities
})
vim.lsp.enable('hls')
