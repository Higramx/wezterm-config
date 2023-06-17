local wezterm = require("wezterm")
-- local mux = wezterm.mux
-- local config = {}

-- wezterm.on('gui-startup', function(cmd)
--     local tab, pane, windows = mux.spawn_window(cmd or {})
-- end)
--

-- local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
-- local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider
-- local SOLID_LEFT_ARROW = "<"
-- local SOLID_RIGHT_ARROW = ">"

-- wezterm.on("gui-startup", function(window)
--     -- window:maximize()
--     window:toggle_fullscreen()
-- end)

wezterm.on('update-status', function(window) -- removed , pane
    local clock = wezterm.format {
        { Foreground = { Color = 'rgb(178, 121, 167)' } },
        -- { Background = { Color = "rgba(0 0 0 0%)" } },
        { Text = "[" .. wezterm.time.now():format("%H:%M") .. "]" },
    }
    window:set_left_status(clock)
end)

wezterm.on('update-right-status', function(window) -- removed , pane
    -- local info = pane:get_foreground_process_info()
    local status = " "
    local pre = '[ '
    local post = ' ]'
    local spacing = '    '
    if window:leader_is_active() then
        status = pre .. 'LEADER' .. post .. spacing
    elseif window:active_key_table() then
        status = pre .. window:active_key_table() .. post .. spacing .. pre .. 'LEADER' .. post .. spacing
    end
    -- if info then status = info end
    window:set_right_status(status)
end)

function tab_title(tab_info)
    local title = tab_info.tab_title
    -- if the tab title is explicitly set, take that
    if title and #title > 0 then
        return title
    end
    -- Otherwise, use the title from the active pane
    -- in that tab
    return tab_info.active_pane.title
end

function checkadmin(titulum)
    for wnn in string.gmatch(titulum, ".*dministrato.*%p(%w-)%..-$") do
        return make_symbol(wnn) .. "@"
    end
    for wuu in string.gmatch(titulum, "(%w+)%p.-$") do
        return make_symbol(wuu)
    end
end

function make_symbol(text)
    if text == "pwsh" then
        return " "
    elseif text == "cmd" then
        return " "
    elseif text == "nvim" then
        return " "
    elseif text == "node" then
        return " "
    elseif text == "git" then
        return " "
    elseif text == "python" then
        return " "
    elseif text == "wslhost" then
        return " "
    elseif text == "wsl" then
        return " "
    else
        return text
    end
end

function current_working(pane, title, max_width)
    local path = ""
    local sda = ""
    for wuu, wii in string.gmatch(pane, ".*(%u:/)(.*)") do
        sda = wuu
        path = wii
    end
    if title ~= nil and sda ~= nil then
        if string.len(title .. sda .. path) > max_width then
            local sd = sda:sub(1, 1)
            return title .. sd .. ":~" .. wezterm.truncate_left(path, max_width - string.len(title .. sda) - 1)
        else
            return title .. sda .. path
        end
    else
        return nil
    end
end

wezterm.on(
    "format-tab-title",
    function(tab, tabs, panes, config, hover, max_width)
        if tab_title(tab) ~= nil and tab_title(tab) ~= "" then
            local title = tab_title(tab)
            if title ~= nil and title ~= "" then
                local pane = tab.active_pane.current_working_dir
                local thingo = checkadmin(title)
                if thingo ~= nil then
                    title = thingo
                end
                if tab.tab_index ~= nil and title ~= nil then
                    title = title .. tab.tab_index + 1 .. "|"
                end
                local thing = current_working(pane, title, max_width)
                if thing ~= nil then
                    title = thing
                end
                if tab.is_active then
                    title = "  " .. title
                else
                    title = " " .. title .. " "
                end
                local foreground = '#d5c4a1'
                if tab.is_active then
                    foreground = '#d59471'
                elseif hover then
                    foreground = '#d5c4a1'
                else
                    foreground = '#d5c4a1'
                end
                return {
                    -- { Background = { Color = "rgba(14 13 11 85%)" } },
                    -- { Foreground = { Color = "rgba(14 13 11 0%)" } },
                    -- { Text = SOLID_LEFT_ARROW },
                    { Background = { Color = "rgba(14 13 11 85%)" } },
                    { Foreground = { Color = foreground } },
                    { Text = title },
                    -- { Background = { Color = "rgba(14 13 11 85%)" } },
                    -- { Foreground = { Color = "rgba(14 13 11 0%)" } },
                    -- { Text = SOLID_RIGHT_ARROW },
                }
            end
        end
    end
)

return {}
