return {
  -- -------- GENERAL PLUGINS ---------
  --  colors
  { 'marko-cerovac/material.nvim' },
  -- vim.o.termguicolors = true

  --  file icons
  { 'nvim-tree/nvim-web-devicons' },

  --  code highlight
  { 'nvim-treesitter/nvim-treesitter',     branch = "master" },

  -- indentation highlight
  { 'lukas-reineke/indent-blankline.nvim', main = "ibl",     opts = {} },

  -- autoclose braces
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },

  -- --------  search through folder ----------
  -- An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
  { 'dyng/ctrlsf.vim' },

  -- Fuzzy file, buffer, mru, tag, etc finder
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    -- or                            , branch = '0.1.x',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  -- code navigation
  {
    'ThePrimeagen/harpoon',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  -- project wide replacements
  { "stefandtw/quickfix-reflector.vim" },
  {
    'gabrielpoca/replacer.nvim',
    config = function()
      require('replacer').setup({
        rename_files = true,
        save_on_write = true,
      })
    end,
  },

  -- ========  search through folder ==========

  --  folder tree
  { 'kyazdani42/nvim-tree.lua' },
  --  bottom status line
  { 'hoob3rt/lualine.nvim',    branch = "master" },

  -- git
  {
    'f-person/git-blame.nvim',
    config = function()
      require('gitblame').setup({
        gitblame_message_template = '         <sha> • <summary> • <author> • <date>',
        gitblame_date_format = '%r',
      })
    end
  },

  -- diff view
  {
    'sindrets/diffview.nvim'
  },

  -- commenting code
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  -- formatting code
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Customize or remove this keymap to your liking
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    -- Everything in opts will be passed to setup()
    opts = {
      -- Define your formatters
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { { "prettierd", "prettier" } },
      },
      -- Set up format-on-save
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
      -- Customize formatters
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2" },
        },
      },
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },

  -- expand/collapse data structures
  {
    'Wansmer/treesj',
    keys = { '<space>m', '<space>j', '<space>s' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
    config = function()
      require('treesj').setup({ --[[ your config ]] })
    end,
  },
  -- ======== GENERAL PLUGINS =========

  -- -------- LINTER AND COMPILERS PLUGINS ---------
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      -- Uncomment these if you want to manage LSP servers from neovim
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      -- Allows using autocomplete by pressing TAB. Used in lsps.lua
      { 'saadparwaiz1/cmp_luasnip' },
      -- Allows using autocomplete by pressing TAB. Used in lsps.lua
      { 'L3MON4D3/LuaSnip' },
    }
  },

  -- error messages highlights
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  -- ======== LINTER AND COMPILERS PLUGINS =========

  -- -------- LANGUAGE SPECIFIC PLUGINS ---------
  -- CSS
  {
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors').setup({
        enable_tailwind = true
      })
    end
  },
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
  { 'RRethy/nvim-treesitter-endwise' },
  -- Lua
  { "bfredl/nvim-luadev" },
  -- ======== LANGUAGE SPECIFIC PLUGINS =========
}
