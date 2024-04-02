{ config, lib, pkgs, ... }:

{

  users.users.ugilt.packages = with pkgs; [
    wofi
    wl-clipboard
    mako
    slurp
  ];

  users.users.ugilt.extraGroups = [ "video" ];
  programs.light.enable = true;
}
