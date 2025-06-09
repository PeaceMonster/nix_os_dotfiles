{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./fvwm.nix
    ./qtile.nix
    ./plasma.nix
    ./hyprland.nix
  ];

  desktops.qtile.enable = lib.mkDefault false;
  desktops.plasma.enable = lib.mkDefault false;
  desktops.fvwm.enable = lib.mkDefault false;
  desktops.hyprland.enable = lib.mkDefault false;
}
