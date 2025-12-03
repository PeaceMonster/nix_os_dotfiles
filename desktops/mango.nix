
{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    desktops.mango.enable = lib.mkEnableOption "Enable fvwm window manager";
  };

  config = lib.mkIf config.desktops.mango.enable {

    programs.mango.enable = true;

    services.displayManager.sessionPackages = [ pkgs.niri ];

    environment.systemPackages = with pkgs; [
      xwayland-satellite
      swaylock
      swaybg
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
      xdg-desktop-portal-wlr
      eww
    ];

  };
}
