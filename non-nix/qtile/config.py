from libqtile import bar, layout, qtile, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy

# from libqtile.utils import guess_terminal
from libqtile.backend.wayland import InputConfig
import os
import subprocess

import yaml
import io

theme = {}

with io.open('/home/ugilt/.config/qtile/theme.yaml') as theme_file:
    theme = yaml.load(theme_file, yaml.Loader)["palette"]

mod = "mod4"
terminal = "kitty"  # "konsole"

from keys import keys, mouse
from groups import groups
from screens import screens

layouts = [
    layout.Columns(
        border_focus_stack=["#" + theme["base09"], "#" + theme["base08"]],
        # border_width=4,
        # margin=5,
        border_on_single=True,
        insert_position=1,
    ),
    layout.Max(),
    # layout.TreeTab(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]




dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = True

floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirm"),
        Match(wm_class="dialog"),
        Match(wm_class="download"),
        Match(wm_class="error"),
        Match(wm_class="file_progress"),
        Match(wm_class="notification"),
        Match(wm_class="splash"),
        Match(wm_class="toolbar"),
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
# , kb_options="caps:escape"
wl_input_rules = {
    "type:keyboard": InputConfig(kb_layout="dk(nodeadkeys)"),
    "type:touchpad": InputConfig(
        dwt=False,
        tap=True,
    ),
}


@hook.subscribe.startup_once
def start_once():
    subprocess.call([os.path.expanduser("~/.config/qtile/autostart.sh")])
    qtile.spawn("kanshi")


# Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
