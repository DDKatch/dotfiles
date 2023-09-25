vim.opt.list = true -- enables custom listchars (configured bellow)
-- vim.opt.listchars:append "space:⋅" -- show ⋅ instead of space
-- vim.opt.listchars:append "eol:↴" -- show ↴ in the end of the line

vim.api.nvim_command('set nonumber')
vim.api.nvim_command("set hidden") -- opening a new file when the current buffer has unsaved changes causes files to be hidden instead of closed
vim.api.nvim_command("set clipboard=unnamedplus") -- set global clipboard buffer so it makes possible to selected text in vim and paste it somewhere else

vim.api.nvim_command("set expandtab") -- always uses spaces instead of tab characters
vim.api.nvim_command("set tabstop=2") -- spaces amount for tab
vim.api.nvim_command("set shiftwidth=2") -- amount of spaces to shift using >> and << commands
vim.api.nvim_command("set smartindent") -- use the same indent as on the line above. And some smart magic too

vim.api.nvim_command("set noswapfile") -- disables usage of a swapfile for the buffer (.swp files)
vim.api.nvim_command("set mouse=a") -- allow scrolling, picking, selecting with mouse?
vim.api.nvim_command("set ffs=unix") -- use unix line-ending in files
vim.api.nvim_command("set number") -- enable line numbers
vim.api.nvim_command("set hlsearch") -- highlight search in file results
vim.api.nvim_command("set cursorline")
vim.api.nvim_command("set smartcase")
-- Backup config 🔴 doesnt work
-- vim.api.nvim_command("set backup")
-- vim.api.nvim_command("set backupdir='~/.nvim/backup/'")
-- vim.api.nvim_command("set writebackup") -- Make backup before overwriting the current buffer
-- vim.api.nvim_command("set backupcopy=yes") -- Overwrite the original backup file
vim.api.nvim_command("au BufWritePre * let &bex = '@' . strftime('%F.%H:%M')") -- 🔴 don't know what is this about
vim.g.mapleader = ' '

-- 🔴 I think it doesn't work
vim.api.nvim_command("highlight ColorColumn ctermbg=DarkGray guibg=Black")
vim.api.nvim_command("highlight clear SpellBad")
vim.api.nvim_command("highlight SpellBad cterm=underline,italic gui=underline,italic")
