{ config, lib, pkgs, ...}:

{
  config = {
    programs.sway.enable = true;
    services.xserver = {
        enable = true;
        displayManager = {
            ssdm.enable = true;
        };
    };
  };
  
}
