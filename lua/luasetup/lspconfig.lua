-- Set up lspconfig.
require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}
-- ^^^ i do not know if i need this ^^^

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require('lspconfig').solargraph.setup {
  capabilities = capabilities,
}

require('lspconfig').eslint.setup {
  capabilities = capabilities,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "vue", "svelte", "astro" },
}

require('lspconfig').tsserver.setup {
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
}

require('lspconfig').svelte.setup {
  capabilities = capabilities,
}

require'lspconfig'.gopls.setup{
  capabilities = capabilities,
}

