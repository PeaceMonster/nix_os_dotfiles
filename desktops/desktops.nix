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

  desktops.qtile.enable = lib.mkDefault true;
  desktops.plasma.enable = lib.mkDefault true;
  desktops.fvwm.enable = lib.mkDefault true;
  desktops.hyprland.enable = lib.mkDefault true;
}
