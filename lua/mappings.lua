local wezterm = require("wezterm")
local act = wezterm.action

return {
    {
        key = "Space",
        mods = "CTRL",
        action = wezterm.action.ShowLauncherArgs { flags = 'LAUNCH_MENU_ITEMS' },
    },
    {
        key = 's',
        mods = 'LEADER',
        action = act.ActivateKeyTable {
            name = 'pane_mode',
            one_shot = false,
            prevent_fallback = true,
        }
    },
    {
        key = 'a',
        mods = 'LEADER',
        action = act.ActivateKeyTable {
            name = 'tab_mode',
            one_shot = false,
            prevent_fallback = true,
        }
    },
    { key = "q", mods = "LEADER",       action = act({ CloseCurrentPane = { confirm = true } }), },
    {
        key = 'p',
        mods = 'CTRL|ALT',
        action = wezterm.action.ActivateCommandPalette,
    },
    -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
    { key = "a", mods = "LEADER|CTRL",  action = act({ SendString = "\x01" }) },
    { key = "f", mods = "LEADER|SHIFT", action = act.Search { Regex = "" }, },
    -- { key = "y", mods = "LEADER",      action = act.ActivateCopyMode },
    {
        key = "t",
        mods = "CTRL|ALT",
        action = act.SpawnCommandInNewTab({ cwd = "C:\\dev" }),
    },
    {
        key = 'r',
        mods = 'LEADER|CTRL',
        action = act.ReloadConfiguration,
    },
    {
        key = "\\",
        mods = "LEADER",
        action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
    },
    {
        key = "|",
        mods = "LEADER|SHIFT",
        action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
    },
    { key = "y",          mods = "LEADER",            action = act.ActivateCopyMode },
    { key = "p",          mods = "LEADER",            action = act.ActivateCommandPalette, },
    { key = '-',          mods = 'LEADER',            action = act.DecreaseFontSize },
    { key = '=',          mods = 'LEADER',            action = act.IncreaseFontSize },
    { key = 'PageUp',     mods = 'CTRL',              action = act.ScrollByPage(-0.3) },
    { key = 'PageDown',   mods = 'CTRL',              action = act.ScrollByPage(0.3) },
    { key = 'h',          mods = 'SHIFT|ALT',         action = act.ActivateTabRelative(-1) },
    { key = 'l',          mods = 'SHIFT|ALT',         action = act.ActivateTabRelative(1) },
    { key = 'LeftArrow',  mods = 'CTRL|ALT',          action = act.ActivateTabRelative(-1) },
    { key = 'RightArrow', mods = 'CTRL|ALT',          action = act.ActivateTabRelative(1) },
    { key = 'Tab',        mods = 'CTRL|SHIFT',        action = act.ActivateTabRelative(-1) },
    { key = 'Tab',        mods = 'CTRL',              action = act.ActivateTabRelative(1) },
    { key = 'h',          mods = 'LEADER|CTRL',       action = act.ActivateTabRelative(-1) },
    { key = 'l',          mods = 'LEADER|CTRL',       action = act.ActivateTabRelative(1) },
    { key = "LeftArrow",  mods = "CTRL|SHIFT|ALT",    action = act.MoveTabRelative(-1) },
    { key = "RightArrow", mods = "CTRL|SHIFT|ALT",    action = act.MoveTabRelative(1) },
    { key = "t",          mods = "LEADER",            action = act({ SpawnTab = "CurrentPaneDomain" }) },
    { key = "h",          mods = "LEADER",            action = act({ ActivatePaneDirection = "Left" }) },
    { key = "j",          mods = "LEADER",            action = act({ ActivatePaneDirection = "Down" }) },
    { key = "k",          mods = "LEADER",            action = act({ ActivatePaneDirection = "Up" }) },
    { key = "l",          mods = "LEADER",            action = act({ ActivatePaneDirection = "Right" }) },
    { key = "LeftArrow",  mods = "CTRL|SHIFT",        action = act({ AdjustPaneSize = { "Left", 5 } }) },
    { key = "DownArrow",  mods = "CTRL|SHIFT",        action = act({ AdjustPaneSize = { "Down", 5 } }) },
    { key = "UpArrow",    mods = "CTRL|SHIFT",        action = act({ AdjustPaneSize = { "Up", 5 } }) },
    { key = "RightArrow", mods = "CTRL|SHIFT",        action = act({ AdjustPaneSize = { "Right", 5 } }) },
    { key = "n",          mods = "SHIFT|CTRL",        action = "ToggleFullScreen" },
    { key = "Enter",      mods = "ALT",               action = "ToggleFullScreen" },
    { key = "F11",        action = "ToggleFullScreen" },
    -- { key = "v", mods = "LEADER|CTRL", action = act.PasteFrom 'Clipboard' },
    { key = "v",          mods = "CTRL|SHIFT",        action = act.PasteFrom 'Clipboard' },
    { key = "v",          mods = "LEADER",            action = act.PasteFrom 'Clipboard' },
    -- { key = "c", mods = "LEADER|CTRL", action = act.CopyTo 'ClipboardAndPrimarySelection' },
    { key = "c",          mods = "CTRL|SHIFT",        action = act.CopyTo 'ClipboardAndPrimarySelection' },
    { key = "c",          mods = "LEADER",            action = act.CopyTo 'ClipboardAndPrimarySelection' },
}
