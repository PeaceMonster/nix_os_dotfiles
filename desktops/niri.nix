
{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    desktops.niri.enable = lib.mkEnableOption "Enable Niri window manager";
  };

  config = {
    programs.niri.enable = config.desktops.niri.enable;
  };
}
