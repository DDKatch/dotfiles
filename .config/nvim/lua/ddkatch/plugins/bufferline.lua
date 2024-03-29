options = {
	numbers = "none", -- | "ordinal" | "buffer_id" | "both",
	number_style = "superscript", -- | "" | { "none", "subscript" }, -- buffer_id at index 1, ordinal at index 2
	mappings = true, -- | false,
	close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
	right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
	left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
	middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
	-- NOTE: this plugin is designed with this icon in mind,
	-- and so changing this is NOT recommended, this is intended
	-- as an escape hatch for people who cannot bear it for whatever reason
	indicator = {
    icon = '▎',
    style = 'icon',
  },
	buffer_close_icon = '',
	modified_icon = '●',
	close_icon = '',
	left_trunc_marker = '',
	right_trunc_marker = '',
	max_name_length = 18,
	max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
	tab_size = 18,
	diagnostics = "nvim_lsp", -- false | "nvim_lsp" | "coc"
	diagnostics_indicator = function(count, level, diagnostics_dict, context)
		return "("..count..")"
	end,
	-- NOTE: this will be called a lot so don't do any heavy processing here
	custom_filter = function(buf_number)
		-- filter out filetypes you don't want to see
		if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
			return true
		end
		-- filter out by buffer name
		if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
			return true
		end
		-- filter out based on arbitrary rules
		-- e.g. filter out vim wiki buffer from tabline in your work repo
		if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
			return true
		end
	end,
	offsets = {
    {
      filetype = "NvimTree",
      text = "Nvim Tree", -- "File Explorer" | function
      text_align = "left",  -- | "center" | "right"}},
      separator = true
    }
  },
  color_icons = true, -- | false, -- whether or not to add the filetype icon highlights
	show_buffer_icons = true, -- | false, -- disable filetype icons for buffers
	show_buffer_close_icons = true, -- | false,
  get_element_icon = function(element)
    -- element consists of {filetype: string, path: string, extension: string, directory: string}
    -- This can be used to change how bufferline fetches the icon
    -- for an element e.g. a buffer or a tab.
    -- e.g.
    local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
    return icon, hl
  end,
  show_close_icon = true, -- | false,
  show_tab_indicators = true, -- | false,
  persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
  -- can also be a table containing 2 custom separators
  -- [focused and unfocused]. eg: { '|', '|' }
  separator_style = "slant", -- | "slant" | "thick" | "thin" | { 'any', 'any' },
  enforce_regular_tabs = false, -- | true,
  always_show_bufferline = true, -- | false,
  sort_by = 'relative_directory', -- 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)}
}

require('bufferline').setup({ options = options })
