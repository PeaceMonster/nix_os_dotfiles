{
  config,
  lib,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland.settings.bind = [
    "$mod, e, exec, emacs"
    "$mod, enter, exec, kitty"
  ];
}
