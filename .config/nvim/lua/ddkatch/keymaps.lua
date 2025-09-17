vim.api.nvim_set_keymap('n', "<leader>xc", ":! chmod a+x %<CR>", { noremap = true })

-- replacer
vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>lua require("replacer").run()<cr>', { silent = true })

-- vim-closetag
vim.g.expand_region_text_objects = {
  closetag_filenames = "*.html.erb,*.html,*.xhtml,*.phtml"
}

-- remap $ to go to the last non-blank character of the line
vim.keymap.set('n', '$', 'g_', { noremap = true, silent = true })
vim.keymap.set('v', '$', 'g_', { noremap = true, silent = true })
