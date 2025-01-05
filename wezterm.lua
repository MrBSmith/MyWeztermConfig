local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Program to lauch when starting Wezterm
config.default_prog = { "powershell" }

-- Font
config.font = wezterm.font("JetBrainsMono NFM")
config.font_size = 16

-- Theme
config.color_scheme = "Catppuccin Mocha"

-- Tabs 
config.enable_tab_bar = false

-- Window settings
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Keys
config.keys = {
  -- Splits
  {
    key = 'v',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'h',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'w',
    mods = 'CTRL',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
}

return config
