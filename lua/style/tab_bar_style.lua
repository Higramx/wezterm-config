local wezterm = require('wezterm')
-- The filled in variant of the < symbol
-- The filled in variant of the > symbol
local SOLID_LEFT_ARROW = ""
local SOLID_RIGHT_ARROW = ""

return {
    active_tab_left = wezterm.format {
        { Background = { Color = '#0b0022' } },
        { Foreground = { Color = '#2b2042' } },
        { Text = SOLID_LEFT_ARROW },
    },
    active_tab_right = wezterm.format {
        { Background = { Color = '#0b0022' } },
        { Foreground = { Color = '#2b2042' } },
        { Text = SOLID_RIGHT_ARROW },
    },
    inactive_tab_left = wezterm.format {
        { Background = { Color = '#0b0022' } },
        { Foreground = { Color = '#1b1032' } },
        { Text = SOLID_LEFT_ARROW },
    },
    inactive_tab_right = wezterm.format {
        { Background = { Color = '#0b0022' } },
        { Foreground = { Color = '#1b1032' } },
        { Text = SOLID_RIGHT_ARROW },
    },
    -- new_tab_right = wezterm.format {
    --     { Background = { Color = '#0b0022' } },
    --     { Foreground = { Color = '#1b1032' } },
    --     { Text = SOLID_RIGHT_ARROW },
    -- },
    new_tab = wezterm.format {
        { Background = { Color = '#0b0022' } },
        { Foreground = { Color = '#1b1032' } },
        { Text = SOLID_RIGHT_ARROW },
    },
}
