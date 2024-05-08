vim.api.nvim_set_keymap('n', "<leader>xc", ":! chmod a+x %<CR>", { noremap = true })

-- replacer
vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>lua require("replacer").run()<cr>', { silent = true })

-- vim-closetag
vim.g.expand_region_text_objects = {
  closetag_filenames = "*.html.erb,*.html,*.xhtml,*.phtml"
}
