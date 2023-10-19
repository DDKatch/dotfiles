  local builtin = require('telescope.builtin')

  vim.keymap.set('n', '<leader>fd', builtin.find_files, {}) -- find files in directory
  vim.keymap.set('n', '<leader>fg', builtin.git_files, {}) -- find files attachet to the git
  vim.keymap.set('n', '<leader>fl', builtin.live_grep, {})
  vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
