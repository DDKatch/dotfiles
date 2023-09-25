vim.opt.list = true -- enables custom listchars (configured bellow)
-- vim.opt.listchars:append "space:⋅" -- show ⋅ instead of space
-- vim.opt.listchars:append "eol:↴" -- show ↴ in the end of the line

vim.opt.number = true
vim.opt.hidden = true -- opening a new file when the current buffer has unsaved changes causes files to be hidden instead of closed
vim.opt.clipboard = "unnamedplus" -- set global clipboard buffer so it makes possible to selected text in vim and paste it somewhere else

vim.opt.expandtab = true -- always uses spaces instead of tab characters
vim.opt.tabstop = 2 -- spaces amount for tab
vim.opt.shiftwidth = 2 -- amount of spaces to shift using >> and << commands
vim.opt.smartindent = true -- use the same indent as on the line above. And some smart magic too

vim.opt.swapfile = false -- disables usage of a swapfile for the buffer (.swp files)
vim.opt.mouse = "a" -- allow scrolling, picking, selecting with mouse?
vim.opt.ffs = "unix" -- use unix line-ending in files
vim.opt.number = true -- enable line numbers
vim.opt.hlsearch = true -- highlight search in file results
vim.opt.cursorline = true
vim.opt.smartcase = true

vim.opt.scrolloff = 8 -- can't go closer than 8 lines to the top or bottom during scrolling
vim.opt.colorcolumn = "80" -- drow a vertical line at 80'th column

vim.g.mapleader = ' '

-- Backup config 🔴 doesnt work
-- vim.opt.backup = true
-- vim.opt.backupdir='~/.nvim/backup/'
-- vim.opt.writebackup = true -- Make backup before overwriting the current buffer
-- vim.opt.backupcopy = "yes" -- Overwrite the original backup file
vim.api.nvim_command("au BufWritePre * let &bex = '@' . strftime('%F.%H:%M')") -- 🔴 don't know what is this about

-- 🔴 I think it doesn't work
vim.api.nvim_command("highlight ColorColumn ctermbg=DarkGray guibg=Black")
vim.api.nvim_command("highlight clear SpellBad")
vim.api.nvim_command("highlight SpellBad cterm=underline,italic gui=underline,italic")
