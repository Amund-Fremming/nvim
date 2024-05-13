local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)

    -- Format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
            -- Check if the LSP client supports formatting
            if client.supports_method("textDocument/formatting") then
                vim.lsp.buf.format({ bufnr = bufnr })
            end
        end,
    })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_insalled = { 'tsserver', 'rust_analyzer', 'omnisharp' },
    handlers = {
        lsp_zero.default_setup,
    },
})

local cmp = require 'cmp'

cmp.setup({
    mapping = {
        ['<C-u>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-e>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-f>'] = cmp.mapping.confirm({ select = true }), -- Confirm with <leader>c
        ['<C-g>'] = cmp.mapping.complete(),                 -- Manually trigger completion with <leader>cp
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- Add other sources as necessary
    }),
    -- Include other configurations as needed
})

-- Configuration for null-ls to use Prettier
require('null-ls').setup({
    sources = {
        require('null-ls').builtins.formatting.prettier.with({
            extra_args = { "--double-quote", "--jsx-double-quote", "--trailing-comma", "es5" },
        }),
    },
})
