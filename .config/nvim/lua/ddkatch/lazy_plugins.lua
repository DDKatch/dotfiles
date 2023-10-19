return {
-- -------- GENERAL PLUGINS ---------
  --  colors
  { 'marko-cerovac/material.nvim' },
  -- vim.o.termguicolors = true

  --  file icons
  { 'kyazdani42/nvim-web-devicons' },

  --  code highlight
  { 'nvim-treesitter/nvim-treesitter', branch = "master" },

  -- indentation highlight
  { 'lukas-reineke/indent-blankline.nvim' },

  -- --------  search through folder ----------
  -- An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
  { 'dyng/ctrlsf.vim' },

  -- Fuzzy file, buffer, mru, tag, etc finder
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.3',
  -- or                            , branch = '0.1.x',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },

  -- ========  search through folder ==========

  --  folder tree
  { 'kyazdani42/nvim-tree.lua' },
  --  bottom status line
  { 'hoob3rt/lualine.nvim', branch = "master" },

  --  upper buffers/tabs line
  { 'akinsho/nvim-bufferline.lua' },

  -- git
  {
    'f-person/git-blame.nvim',
    config = function() require('gitblame').setup({
      gitblame_message_template = '         <sha> • <summary> • <author> • <date>',
      gitblame_date_format = '%r',
    }) end
  },

  -- commenting code
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
-- ======== GENERAL PLUGINS =========

-- -------- LINTER AND COMPILERS PLUGINS ---------
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Uncomment these if you want to manage LSP servers from neovim
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
      -- Allows using autocomplete by pressing TAB. Used in lsps.lua
      {'saadparwaiz1/cmp_luasnip'},
      -- Allows using autocomplete by pressing TAB. Used in lsps.lua
      {'L3MON4D3/LuaSnip'},
    }
  },
-- ======== LINTER AND COMPILERS PLUGINS =========

-- -------- LANGUAGE SPECIFIC PLUGINS ---------
  -- Golang
  { 'fatih/vim-go' },
  -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  -- Ruby
  { 'ngmy/vim-rubocop' },
-- ======== LANGUAGE SPECIFIC PLUGINS =========
}
