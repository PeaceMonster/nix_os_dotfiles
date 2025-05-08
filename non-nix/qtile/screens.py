from libqtile import bar, layout, qtile, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy

import yaml
import io

theme = {}

with io.open('/home/ugilt/.config/qtile/theme.yaml') as theme_file:
    theme = yaml.load(theme_file, yaml.Loader)["palette"]


# from libqtile.utils import guess_terminal
from libqtile.backend.wayland import InputConfig
import os
import subprocess

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()


screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayout(

                    foreground = theme["base07"],
                    ),
                widget.GroupBox(
                    this_current_screen_border=theme[ "base09" ],
                    inactive = theme["base04"],
                    active = theme["base07"],
                    this_screen_border = theme["base0D"]
                    ),
                widget.WindowName(
                    foreground = theme["base07"],
                    ),
                widget.PulseVolume(
                    foreground = theme["base07"],
                    ),
                widget.Backlight(
                    foreground = theme["base07"],
                    max_brightness_file="/sys/class/backlight/intel_backlight/max_brightness",
                    brightness_file="/sys/class/backlight/intel_backlight/brightness",
                    change_command="brightnessctl s {0}%",
                ),
                widget.Battery(
                    foreground = theme["base07"],
                    ),
                widget.Clock(
                    foreground = theme["base07"],
                    format="%Y-%m-%d %a %I:%M %p"
                    ),
            ],
            24,
            background= theme["base00"],
        ),
        wallpaper="~/.config/qtile/background.png",
        wallpaper_mode="fill",
    ),
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayout(

                    foreground = theme["base07"],
                    ),
                widget.GroupBox(
                    this_current_screen_border=theme[ "base09" ],
                    inactive = theme["base04"],
                    active= theme["base07"],
                    this_screen_border = theme["base0D"]
                    ),
                widget.Prompt(
                    foreground = theme["base07"],
                    ),
                widget.WindowName(
                    foreground = theme["base07"],
                    ),
                widget.Battery(
                    foreground = theme["base07"],
                    ),
                widget.Clock(
                    foreground = theme["base07"],
                    format="%Y-%m-%d %a %I:%M %p"),
            ],
            24,
            background= theme["base00"],
        ),
        wallpaper="~/.config/qtile/background.png",
        wallpaper_mode="fill",
    ),
    Screen(
        wallpaper="~/.config/qtile/background.png",
        wallpaper_mode="fill",
        bottom=bar.Bar(
            [
                widget.CurrentLayout(

                    foreground = theme["base07"],
                    ),
                widget.GroupBox(
                    this_current_screen_border=theme[ "base09" ],
                    inactive = theme["base04"],
                    active= theme["base07"],
                    this_screen_border = theme["base0D"]
                    ),
                widget.Prompt(
                    foreground = theme["base07"],
                    ),
                widget.WindowName(
                    foreground = theme["base07"],
                    ),
                widget.Battery(
                    foreground = theme["base07"],
                    ),
                widget.Clock(
                    foreground = theme["base07"],
                    format="%Y-%m-%d %a %I:%M %p"),
            ],
            24,
            background= theme["base00"],
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
]
