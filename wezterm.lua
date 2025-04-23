local wezterm = require("wezterm")
local config = {}

config.color_scheme_dirs = { "./colors" }
config.color_scheme = "darkforest"

-- Disable ligatures
config.harfbuzz_features = {"calt=0", "clig=0", "liga=0"}

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 16.0

config.initial_cols = 150
config.initial_rows = 40

config.keys = {
    {key="LeftArrow", mods="ALT", action=wezterm.action{SendString="\x1bb"}},
    {key="RightArrow", mods="ALT", action=wezterm.action{SendString="\x1bf"}},

    {key="LeftArrow", mods="SUPER", action=wezterm.action{SendString="\x1bOH"}},
    {key="RightArrow", mods="SUPER", action=wezterm.action{SendString="\x1bOF"}},

    {key="Backspace", mods="SUPER", action=wezterm.action{SendString="\x15"}},
}

config.window_decorations  = "RESIZE"
config.window_padding = {
    -- left = "1cell",
    -- right = "1cell",
    top = "1cell",
    -- bottom = "0.5cell"
}

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

local process_icons = {
    ["bash"] = wezterm.nerdfonts.cod_terminal_bash,
    ["btm"] = wezterm.nerdfonts.mdi_chart_donut_variant,
    ["cargo"] = wezterm.nerdfonts.dev_rust,
    ["curl"] = wezterm.nerdfonts.mdi_flattr,
    ["docker"] = wezterm.nerdfonts.linux_docker,
    ["docker-compose"] = wezterm.nerdfonts.linux_docker,
    ["gh"] = wezterm.nerdfonts.dev_github_badge,
    ["git"] = wezterm.nerdfonts.fa_git,
    ["go"] = wezterm.nerdfonts.seti_go,
    ["htop"] = wezterm.nerdfonts.mdi_chart_donut_variant,
    ["kubectl"] = wezterm.nerdfonts.linux_docker,
    ["kuberlr"] = wezterm.nerdfonts.linux_docker,
    ["lazydocker"] = wezterm.nerdfonts.linux_docker,
    ["lazygit"] = wezterm.nerdfonts.oct_git_compare,
    ["lua"] = wezterm.nerdfonts.seti_lua,
    ["make"] = wezterm.nerdfonts.seti_makefile,
    ["node"] = wezterm.nerdfonts.mdi_hexagon,
    ["nvim"] = wezterm.nerdfonts.custom_vim,
    ["psql"] = "󱤢",
    ["ruby"] = wezterm.nerdfonts.cod_ruby,
    ["stern"] = wezterm.nerdfonts.linux_docker,
    ["sudo"] = wezterm.nerdfonts.fa_hashtag,
    ["usql"] = "󱤢",
    ["vim"] = wezterm.nerdfonts.dev_vim,
    ["wget"] = wezterm.nerdfonts.mdi_arrow_down_box,
    ["zsh"] = wezterm.nerdfonts.dev_terminal,
}

local function remove_abs_path(path) return path:gsub("(.*[/\\])(.*)", "%2") end

local function get_process(tab)
    local process_name = remove_abs_path(tab.active_pane.foreground_process_name)
    local icon = process_icons[process_name]
    return icon and icon .. string.format(" %s", process_name) or string.format("%s", process_name)
end

local function format_title(tab)
    local process = get_process(tab)
    return string.format(" %s ", process)
end

local function get_tab_title(tab)
    local title = tab.tab_title
    if title and #title > 0 then return title end
    return format_title(tab)
end

wezterm.on("format-tab-title", function(tab, _, _, _, _, _)
    local title = get_tab_title(tab)
    return {
        { Attribute = { Intensity = "Bold" } },
        { Text = title },
    }
end)

return config
