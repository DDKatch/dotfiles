local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
  require("lazy_plugins"),
  opts
)

require("ddkatch")

-- ====================
-- |  TIPS AND TRICS  |
-- ====================
--
-- -----visualize tab with ⇥ symbol-------
-- -----(tab becomes an actual tab)-------
-- set list
-- set listchars=tab:\⇥\ ,trail:·,extends:>,precedes:<,nbsp:+
-- ---------------------------------------
--
-- -----load local dir .vimrc file--------
-- set exrc
-- set secure
-- ---------------------------------------
--
-- -------sudo tee hack-------------------
-- :w !sudo tee %
-- ---------------------------------------
--
-- ====================
-- ^  TIPS AND TRICS  ^
-- ====================
