local wezterm = require("wezterm")
local config = wezterm.config_builder()
local action = wezterm.action

-- Program to lauch when starting Wezterm
config.default_prog = { "powershell" }

-- Font
config.font = wezterm.font("JetBrainsMono NFM")
config.font_size = 13

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
    key = 'h',
    mods = 'CTRL|SHIFT|ALT',
    action = action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 's',
    mods = 'CTRL|SHIFT|ALT',
    action = action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'w',
    mods = 'CTRL|SHIFT|ALT',
    action = action.CloseCurrentPane { confirm = true },
  },
  {
    key = ']',
    mods = 'CTRL',
    action = action.Hide,
  },
}

config.mouse_bindings = {
	{
    -- Copy & Paste with mouse's right click
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action_callback(function(window, pane)
			local has_selection = window:get_selection_text_for_pane(pane) ~= ""
			if has_selection then
				window:perform_action(action.CopyTo("ClipboardAndPrimarySelection"), pane)
				window:perform_action(action.ClearSelection, pane)
        window:perform_action(action({ PasteFrom = "Clipboard" }), pane)
			end
		end),
	},
}

return config
