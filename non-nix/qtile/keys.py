from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy

from libqtile.backend.wayland import InputConfig
import os
import subprocess

mod = "mod4"
terminal = "kitty"  # "konsole"


keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    # Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "Tab", lazy.prev_layout(), desc="Go back"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key(
        [mod, "control"],
        "t",
        lazy.window.toggle_floating(),
        desc="Toggle floating on the focused window",
    ),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod, "control"], "o", lazy.spawn("swaylock")),
    Key([mod], "y", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod], "comma", lazy.next_screen(), desc="Next Screen"),
    Key(
        [mod],
        "d",
        lazy.spawn(os.path.expanduser("~/.config/rofi/launchers/type-6/launcher.sh")),
        desc="Launch menu",
    ),
    Key(
        [mod],
        "b",
        lazy.spawn("/home/ugilt/.local/share/qute-containers/container-open"),
        desc="Launch select browser",
    ),
    # Media Keys
    Key(
        [],
        "XF86AudioLowerVolume",
        lazy.spawn("pamixer --decrease 5"),
        desc="Lower Volume 5%",
    ),
    Key(
        [],
        "XF86AudioRaiseVolume",
        lazy.spawn("pamixer --increase 5"),
        desc="Raise VOlume 5%",
    ),
    Key(
        [],
        "XF86AudioMute",
        lazy.spawn("pamixer --toggle-mute"),
        desc="Toggle Mute",
    ),
    # Backlight
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl s 10%+")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl s 10%-")),
    Key(
        [mod],
        "a",
        lazy.spawn("touch /tmp/activefile"),
        desc="Touches activefile which can be used with entr",
    ),
    Key([mod, "control"], "b", lazy.spawn("playerctl previous")),
    Key([mod, "control"], "n", lazy.spawn("playerctl play-pause")),
    Key([mod, "control"], "m", lazy.spawn("playerctl next")),
    Key([mod], "n", lazy.spawn("neovide")),
    Key([mod], "e", lazy.spawn("emacs")),
]

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )



keys.extend(
    [
        Key([mod], "F8", lazy.group["sp"].dropdown_toggle("bluetooth")),
        Key([mod], "F9", lazy.group["sp"].dropdown_toggle("spotify")),
        Key([mod], "F3", lazy.group["sp"].dropdown_toggle("bitwarden")),
        Key([mod], "F1", lazy.group["sp"].dropdown_toggle("scratch-vim")),
        Key([mod], "F2", lazy.group["sp"].dropdown_toggle("scratch-term")),
    ]
)


for i in "123456789OT":
    keys.extend(
        [
            # mod1 + group number = switch to group
            Key(
                [mod],
                i,
                lazy.group[i].toscreen(),
                desc="Switch to group {}".format(i),
            ),
            # mod1 + shift + group number = switch to
            # & move focused window to group
            Key(
                [mod, "shift"],
                i,
                lazy.window.togroup(i, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]
