
from libqtile import bar, layout, qtile, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy

# from libqtile.utils import guess_terminal
from libqtile.backend.wayland import InputConfig
import os
import subprocess


groups = [
    Group("1"),
    Group("2"),
    Group("3"),
    Group("4"),
    Group("5"),
    Group("6"),
    Group("7"),
    Group("8"),
    Group("9"),
    Group("O", spawn=["obsidian"], matches=[Match(wm_class="obsidian")]),
    Group("T", matches=Match(wm_class="thunderbird")),
    ScratchPad(
        "sp",
        [
            DropDown(
                "spotify",
                "spotify",
                height=0.6,
            ),
            DropDown(
                "bitwarden",
                "bitwarden",
                height=0.8,
                width=0.5,
                y=0.1,
                on_focus_lost_hide=False,
            ),
            DropDown(
                "scratch-vim",
                'kitty nvim /tmp/scratchpad',
                height=0.7,
                width=0.6,
                y=0.15,
                x=0.2,
                on_focus_lost_hide=False,
            ),
            DropDown(
                "scratch-term",
                "kitty",
                height=0.7,
                width=0.6,
                y=0.15,
                x=0.2,
                on_focus_lost_hide=False,
            ),
            DropDown(
                "bluetooth",
                "blueman-manager",
                height=0.7,
                width=0.6,
                y=0.15,
                x=0.2,
                on_focus_lost_hide=False,
            )
        ],
    ),
]
