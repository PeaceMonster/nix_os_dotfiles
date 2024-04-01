{ config, lib, pkgs, ... }:

{
  config = {
    # Enable the KDE Plasma Desktop Environment.
    services.xserver.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    # Configure keymap in X11
    services.xserver = {
      enable = true;
      xkb.layout = "dk";
      xkb.variant = "nodeadkeys";
    };
  };
}
