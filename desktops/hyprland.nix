{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    desktops.hyprland.enable = lib.mkEnableOption "Enable hyprland window manager";
  };

  config = lib.mkIf config.desktops.hyprland.enable {
    programs.hyprland.enable = true;

    environment.systemPackages = [
      pkgs.kitty
    ];

    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
