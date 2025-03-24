{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    desktops.fvwm.enable = lib.mkEnableOption "Enable fvwm window manager";
  };

  config = {
    services.xserver.windowManager.fvwm3.enable = config.desktops.fvwm.enable;
  };
}
