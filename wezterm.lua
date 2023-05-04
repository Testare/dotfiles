local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'Batman'
config.leader = { key = 'w', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
    {
        key = '%',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = '\"',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },

}
config.font = wezterm.font 'Fira Code Medium'
config.font_size = 10.5

-- and finally, return the configuration to wezterm
return config
