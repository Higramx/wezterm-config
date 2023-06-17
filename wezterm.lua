local wezterm = require("wezterm")
-- local mux = wezterm.mux
-- local act = wezterm.action

require("lua.wezterm_on")
-------------------------------
--TODO
-------------------------------

local rose_pine = require('lua/style/rosepine/lua/rose-pine').colors()
local rp_window_frame = require('lua/style/rosepine/lua/rose-pine').window_frame()

local catppuccin_gruv = require("lua.style.colors")

local config = {
    set_environment_variables = {
        -- rawdogging it: $e]9;9;$P$e\$P$G
        -- prompt = "$E]7;file://localhost/$P$E\\$E[32m$T$E[0m $E[35m$P$E[36m$_$G$E[0m ",
        prompt = "$E]7;file://localhost/$P$E\\$E[35m$T$H$H$H$S$E[36mCMD$G$E[93m$P$E[36m$G$E[0m ",
    },
    check_for_updates = false,
    -- font = wezterm.font("CaskaydiaCove NF"),
    font = wezterm.font("FiraCode Nerd Font"),
    color_scheme = require("lua.style.colorscheme"),
    colors = catppuccin_gruv,
    prefer_egl = true,
    warn_about_missing_glyphs = false,
    animation_fps = 60,
    cursor_blink_rate = 1000,
    window_background_opacity = 0.80,
    text_background_opacity = 0.95,
    window_padding = {
        top = 0,
        bottom = 0,
        left = 0,
        right = 0,
    },
    tab_max_width = 26,
    command_palette_bg_color = "rgba(19 17 16 50%)",
    -- window_close_confirmation = "NeverPrompt",
    inactive_pane_hsb = {
        hue = 1.0,
        saturation = 1.0,
        brightness = 1.0,
    },
    window_decorations = "INTEGRATED_BUTTONS|RESIZE",
    use_fancy_tab_bar = false,
    default_prog = { "pwsh", "-NoLogo" },
    default_cwd = "C:\\dev",
    font_size = 18.0,
    status_update_interval = 1000,
    launch_menu = {
        { label = "nu",          args = { "nu" } },
        { label = "nvim",        args = { "nu", "-c", "nvim" } },
        { label = "PowerShell",  args = { "pwsh", "-NoLogo" } },
        { label = "PowerShellA", args = { "eledo", "pwsh", "-NoLogo" } },
        { label = "CMD",         args = { "cmd", "-NoLogo" } },
    },
    disable_default_key_bindings = true,
    leader = { key = "Space", mods = "SHIFT", timeout_milliseconds = 2000 },
    keys = require("lua.mappings"),
    show_tab_index_in_tab_bar = true,
    --set_environment_variables = {},
    key_tables = {
        pane_mode = require("lua.modes.pane_mode"),
        tab_mode = require("lua.modes.tab_mode"),
    },
}

-- config.colors = require("lua.colors.rose-pine").colors()
-- config.window_frame = require("lua.colors.rose-pine").window_frame()

--config.front_end = "Software" -- OpenGL doesn't work quite well with RDP.
config.term = "" -- Set to empty so FZF works on windows

return config
