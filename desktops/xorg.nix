{ config, lib, pkgs, ... }:

{
  users.users.ugilt.packages = with pkgs; [
    rofi
    xclip
  ];

}
