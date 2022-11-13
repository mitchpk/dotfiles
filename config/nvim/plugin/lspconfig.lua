local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
    vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
        end,
    })
end

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.sumneko_lua.setup {
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        enable_format_on_save(client, bufnr)
    end,
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
    capabilities = capabilities
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

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
}
)

vim.diagnostic.config({
    virtual_text = {
        prefix = '●'
    },
    update_in_insert = true,
    float = {
        source = "always"
    }
})
