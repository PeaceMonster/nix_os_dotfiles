{
  config,
  lib,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";

      "kb_layout" = "dk";
      "kb_variant" = "nodeadkeys";

      monitor = [
        ", preferred, auto, 1"
      ];
    };
  };
  includes = [
    ./binds.nix
  ];
}
