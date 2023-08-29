local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    client.server_capabilities.semanticTokensProvider = nil

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gR', vim.lsp.buf.rename, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.volar.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.lua_ls.setup {
    on_attach = on_attach,
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
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        ['rust-analyzer'] = {
            completion = {
                postfix = {
                    enable = false,
                },
            },
        }
    }
}

nvim_lsp.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.gdscript.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.svelte.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.texlab.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.jdtls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.elmls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
