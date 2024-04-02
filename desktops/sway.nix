{ config, lib, pkgs, ... }:

{
  imports = [
    ./wayland.nix
  ];

  config = {
    programs.sway.enable = true;
    services.xserver = {
      enable = true;
      xkb.layout = "dk";
      xkb.variant = "nodeadkeys";

      displayManager = {
        sddm.enable = true;
      };
    };
  };
}
