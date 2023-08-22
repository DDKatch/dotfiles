local cmp = require 'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require('luasnip').expand_or_jumpable() then
        require('luasnip').expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require('luasnip').jumpable(-1) then
        require('luasnip').jump(-1)
      else
        fallback()
      end
    end,
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- require('lspconfig').tsserver.setup {
--   capabilities = capabilities
-- }

local lsp_installer = require('nvim-lsp-installer')

lsp_installer.on_server_ready(function(server)
  local opts  = {}
  server:setup(opts)
end)

local map = require('utils').map

map('n', '>', ':lua vim.lsp.buf.definition()<cr>')
map('n', '<', ':e#<cr>') -- get back to prev opened file
--map('n', 'gD', ':lua vim.lsp.buf.declaration()<cr>')
--map('n', 'gi', ':lua vim.lsp.buf.implementation()<cr>')
--map('n', 'gw', ':lua vim.lsp.buf.document_symbol()<cr>')
--map('n', 'gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
--map('n', 'gr', ':lua vim.lsp.buf.references()<cr>')
--map('n', 'gt', ':lua vim.lsp.buf.type_definition()<cr>')
--map('n', 'K', ':lua vim.lsp.buf.hover()<cr>')
--map('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
--map('n', '<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
--map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<cr>')
