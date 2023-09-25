vim.api.nvim_create_autocmd("TermClose", {
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", ":Bdelete<CR>", { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(
			buf,
			"t",
			"<Esc>",
			vim.api.nvim_replace_termcodes("<C-\\><C-N>:Bdelete<CR>", true, true, true),
			{ noremap = true, silent = true }
		)
	end,
})
