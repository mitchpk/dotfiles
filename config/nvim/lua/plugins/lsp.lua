require'lspconfig'.clangd.setup{}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.cssls.setup{capabilities=capabilities}
require'lspconfig'.dartls.setup{}
require'lspconfig'.gdscript.setup{}
require'lspconfig'.gopls.setup{}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require'lspconfig'.html.setup{capabilities=capabilities}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require'lspconfig'.jsonls.setup {
  capabilities=capabilities,
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  }
}
require'lspconfig'.texlab.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.svelte.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.volar.setup{
  init_options = {
    typescript = {
      serverPath = '/home/mitchell/.local/lib/node_modules/typescript/lib/tsserverlibrary.js'
    }
  }
}
