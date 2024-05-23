local wezterm = require("wezterm")
local config = {}

config.color_scheme_dirs = { "./colors" }
config.color_scheme = "darkforest"

-- config.harfbuzz_features = {"calt=0", "clig=0", "liga=0"}

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

config.hide_tab_bar_if_only_one_tab = true
config.window_decorations  = "RESIZE"
config.window_padding = {
    -- left = "1cell",
    -- right = "1cell",
    top = "1cell",
    -- bottom = "0.5cell"
}

return config
