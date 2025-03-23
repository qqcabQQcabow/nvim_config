local cmp = require 'cmp'

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        --documentation = cmp.config.window.bordered()
        documentation = false,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, {"i", "s"})
    }),
    sources = cmp.config.sources(
      {
        { name = 'nvim_lsp' },
      },
      {
        { name = 'path' },
      }
      --{
      --  { name = 'buffer' },
      --}
    )
})

-- Set configuration for specific filetype.
--cmp.setup.filetype('gitcommit', {
--    sources = cmp.config.sources({
--        {name = 'cmp_git'} -- You can specify the `cmp_git` source if you were installed it.
--    }, {{name = 'buffer'}})
--})
--
---- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({'/', '?'}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {{name = 'buffer'}}
})
--
---- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})
--
---- Set up lspconfig.
--local capabilities = require('cmp_nvim_lsp').default_capabilities()
--require('lspconfig')['clangd'].setup {capabilities = capabilities}
--
---- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
