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

vim.lsp.config('roslyn_ls', {
    capabilities = capabilities,
    root_dir = function(bufnr, cb)
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if not bufname:match('MetadataAsSource/') then
            local root_dir = vim.fs.root(bufnr, function(fname, _)
                return fname:match('%.sln[x]?$') ~= nil
            end)

            if not root_dir then
                root_dir = vim.fs.root(bufnr, function(fname, _)
                    return fname:match('%.csproj$') ~= nil
                end)
            end

            if root_dir then
                cb(root_dir)
            end
        else
            local prev_buf = vim.fn.bufnr('#')
            local client = vim.lsp.get_clients({
                name = 'roslyn_ls',
                bufnr = prev_buf ~= -1 and prev_buf or nil,
            })[1]
            if client then
                cb(client.config.root_dir)
            end
        end
    end,
    handlers = {
        ["textDocument/diagnostic"] = function(err, result, ctx, config)
            if result and result.items then
                local bufname = vim.api.nvim_buf_get_name(ctx.bufnr)

                if bufname:match('MetadataAsSource/') then
                    -- Return empty diagnostics for metadata files
                    result.items = {}
                end
            end

            return vim.lsp.handlers["textDocument/diagnostic"](err, result, ctx, config)
        end,
    },
})

vim.lsp.enable('roslyn_ls')
