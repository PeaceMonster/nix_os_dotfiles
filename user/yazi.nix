{ config, lib, pkgs, ...}:

{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };


}