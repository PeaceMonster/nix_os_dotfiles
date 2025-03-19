{
  config,
  lib,
  pkgs,
  ...
}: {
  config = {
    # Enable the KDE Plasma Desktop Environment.
    services.desktopManager.plasma6.enable = true;

    # Configure keymap in X11
    services = {
      xserver = {
        enable = true;
        xkb.layout = "dk";
        xkb.variant = "nodeadkeys";
      };

      displayManager = {
        sddm.enable = true;
      };
    };
  };
}
