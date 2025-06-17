
{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    desktops.niri.enable = lib.mkEnableOption "Enable Niri window manager";
  };

  config = lib.mkIf config.desktops.niri.enable {

    programs.niri.enable = true;

    services.displayManager.sessionPackages = [ pkgs.niri ];

    environment.systemPackages = with pkgs; [
      xwayland-satellite
      swaylock
      swaybg
      waybar
      #xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
      xdg-desktop-portal-wlr
      eww
    ];

  };
}
