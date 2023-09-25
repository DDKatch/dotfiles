-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
-- -------- GENERAL PLUGINS ---------
  --  colors
  use { 'marko-cerovac/material.nvim' }
  vim.o.termguicolors = true

  --  file icons
  use { 'kyazdani42/nvim-web-devicons' }

  --  code highlight
  use { 'nvim-treesitter/nvim-treesitter', branch = "master" }

  -- indentation highlight
  use { 'lukas-reineke/indent-blankline.nvim' }

  -- --------  search through folder ----------
  -- An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
  use {
    'dyng/ctrlsf.vim',
    config = function() require('git-blame').setup({
      ctrlsf_ignore_dir = {'log', 'tmp', 'node_modules', 'public', '.git', 'public'},
      ctrlsf_auto_focus = { at = "start" },
    }) end
  }
  vim.api.nvim_set_keymap('n', "<C-F>f", "<Plug>CtrlSFPrompt", { noremap = true })
  vim.api.nvim_set_keymap('n', "<C-F>n", "<Plug>CtrlSFCwordPath", { noremap = true })
  vim.api.nvim_set_keymap('n', "<C-F>p", "<Plug>CtrlSFPwordPath", { noremap = true })

  -- Fuzzy file, buffer, mru, tag, etc finder
  use {
    'kien/ctrlp.vim',
    config = function() require('git-blame').setup({
      ctrlp_map = '<c-p>',
      ctrlp_cmd = 'CtrlP',
      ctrlp_working_path_mode = 'ra',
      ctrlp_match_window_reversed = 0,
      ctrlp_extensions = {'tag'},
      ctrlp_custom_ignore = "vendor|node_modules|tmp|DS_Store|.git",
    }) end
  }
  vim.api.nvim_command("set wildignore+=*/tmp/*,*.so,*.swp,*.zip")
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
    config = function() require('git-blame').setup({
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
  use { 'williamboman/nvim-lsp-installer' }
  use { 'neovim/nvim-lspconfig' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/nvim-cmp' }

  -- Allows using autocomplete by pressing TAB. Used in lsps.lua
  use { 'L3MON4D3/LuaSnip', tag = 'v2.0.0', run = 'make install_jsregexp' }
-- ======== LINTER AND COMPILERS PLUGINS =========

-- -------- LANGUAGE SPECIFIC PLUGINS ---------
  -- Golang
  use { 'fatih/vim-go', cmd = ":GoUpdateBinaries" }
  -- Markdown
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }
-- ======== LANGUAGE SPECIFIC PLUGINS =========
end)
