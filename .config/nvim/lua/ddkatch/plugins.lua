-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
-- -------- GENERAL PLUGINS ---------
  -- plugin manager
  use { 'wbthomason/packer.nvim' }

  --  colors
  use { 'marko-cerovac/material.nvim' }
  vim.o.termguicolors = true

  --  file icons
  use { 'kyazdani42/nvim-web-devicons' }

  --  code highlight
  use { 'nvim-treesitter/nvim-treesitter', branch = "master", run=':TSUpdate' }

  -- indentation highlight
  use { 'lukas-reineke/indent-blankline.nvim' }

  -- --------  search through folder ----------
  -- An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
  use { 'dyng/ctrlsf.vim' }
  vim.api.nvim_set_keymap('n', "<C-F>f", "<Plug>CtrlSFPrompt", { noremap = true })
  vim.api.nvim_set_keymap('n', "<C-F>n", "<Plug>CtrlSFCwordPath", { noremap = true })
  vim.api.nvim_set_keymap('n', "<C-F>p", "<Plug>CtrlSFPwordPath", { noremap = true })

  -- Fuzzy file, buffer, mru, tag, etc finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.3',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>fd', builtin.find_files, {}) -- find files in directory
  vim.keymap.set('n', '<leader>fg', builtin.git_files, {}) -- find files attachet to the git
  vim.keymap.set('n', '<leader>fl', builtin.live_grep, {})
  vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  -- ========  search through folder ==========

  --  folder tree
  use { 'kyazdani42/nvim-tree.lua' }

  --  bottom status line
  use { 'hoob3rt/lualine.nvim', branch = "master" }

  --  upper buffers/tabs line
  use { 'akinsho/nvim-bufferline.lua' }

  -- git
  use {
    'f-person/git-blame.nvim',
    config = function() require('gitblame').setup({
      gitblame_message_template = '         <sha> • <summary> • <author> • <date>',
      gitblame_date_format = '%r',
    }) end
  }

  -- commenting code
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
-- ======== GENERAL PLUGINS =========

-- -------- LINTER AND COMPILERS PLUGINS ---------
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
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
  }
-- ======== LINTER AND COMPILERS PLUGINS =========

-- -------- LANGUAGE SPECIFIC PLUGINS ---------
  -- Golang
  use { 'fatih/vim-go', cmd = ":GoUpdateBinaries" }
  -- Markdown
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }
-- ======== LANGUAGE SPECIFIC PLUGINS =========
end)
