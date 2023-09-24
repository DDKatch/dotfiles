-- it solves a problem when neovim freezes when it is trying to apply colors for a huge json file

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.json"},
  callback = function(ev)
    vim.api.nvim_command("%!jq .")
    vim.api.nvim_command("w")
  end
})
