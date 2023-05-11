local wezterm = require("wezterm")
local act = wezterm.action

return {
    { key = "h",          action = wezterm.action({ ActivatePaneDirection = "Left" }) },
    { key = "j",          action = wezterm.action({ ActivatePaneDirection = "Down" }) },
    { key = "k",          action = wezterm.action({ ActivatePaneDirection = "Up" }) },
    { key = "l",          action = wezterm.action({ ActivatePaneDirection = "Right" }) },
    { key = "LeftArrow",  action = wezterm.action({ ActivatePaneDirection = "Left" }) },
    { key = "DownArrow",  action = wezterm.action({ ActivatePaneDirection = "Down" }) },
    { key = "UpArrow",    action = wezterm.action({ ActivatePaneDirection = "Up" }) },
    { key = "RightArrow", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
    {
        key = "h",
        mods = "SHIFT",
        action = wezterm.action({
            AdjustPaneSize = { "Left", 5 } })
    },
    {
        key = "j",
        mods = "SHIFT",
        action = wezterm.action({
            AdjustPaneSize = { "Down", 5 } })
    },
    {
        key = "k",
        mods = "SHIFT",
        action = wezterm.action({
            AdjustPaneSize = { "Up", 5 } })
    },
    {
        key = "l",
        mods = "SHIFT",
        action = wezterm.action({
            AdjustPaneSize = { "Right", 5 } })
    },
    {
        key = "LeftArrow",
        mods = "SHIFT",
        action = wezterm.action({
            AdjustPaneSize = { "Left", 5 } })
    },
    {
        key = "DownArrow",
        mods = "SHIFT",
        action = wezterm.action({
            AdjustPaneSize = { "Down", 5 } })
    },
    {
        key = "UpArrow",
        mods = "SHIFT",
        action = wezterm.action({
            AdjustPaneSize = { "Up", 5 } })
    },
    {
        key = "RightArrow",
        mods = "SHIFT",
        action = wezterm.action({
            AdjustPaneSize = { "Right", 5 } })
    },
    { key = "z",      action = "TogglePaneZoomState" },
    {
        key = "\\",
        action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
    },
    {
        key = "|",
        mods = "SHIFT",
        action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
    },
    {
        key = "s",
        mods = "SHIFT",
        action = act.PaneSelect({
            mode = "SwapWithActive",
        }),
    },
    {
        key = "x",
        mods = "SHIFT",
        action = wezterm.action({ CloseCurrentPane = { confirm = true } }),
    },
    { key = 'c',      mods = "CTRL",                 action = act.PopKeyTable },
    { key = 'Escape', action = act.PopKeyTable },
}
