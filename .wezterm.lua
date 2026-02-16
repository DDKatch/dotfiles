local wezterm = require 'wezterm'

return {
  enable_csi_u_key_encoding = true, -- important for modified keys
  keys = {
    -- Send a unique sequence for Shift+Enter
    { key = 'Enter', mods = 'SHIFT', action = wezterm.action.SendString('\n') },
  },
}
