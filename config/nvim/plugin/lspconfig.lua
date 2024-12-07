local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

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
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
    end,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp.volar.setup {
    capabilities = capabilities,
    init_options = {
        vue = {
            hybridMode = false
        }
    }
}

nvim_lsp.lua_ls.setup {
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
}

nvim_lsp.rust_analyzer.setup {
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
}

nvim_lsp.ts_ls.setup {
    capabilities = capabilities
}

nvim_lsp.ccls.setup {
    capabilities = capabilities,
    init_options = {
        completion = {
            detailedLabel = false
        }
    }
}

nvim_lsp.gdscript.setup {
    capabilities = capabilities
}

nvim_lsp.gopls.setup {
    capabilities = capabilities
}

nvim_lsp.pyright.setup {
    capabilities = capabilities
}

nvim_lsp.cssls.setup {
    capabilities = capabilities
}

nvim_lsp.svelte.setup {
    capabilities = capabilities
}

nvim_lsp.texlab.setup {
    capabilities = capabilities
}

nvim_lsp.jdtls.setup {
    capabilities = capabilities
}

nvim_lsp.clojure_lsp.setup {
    capabilities = capabilities
}
