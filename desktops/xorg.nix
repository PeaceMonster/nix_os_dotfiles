{ config, lib, pkgs, ... }:

{
  users.users.ugilt.packages = with pkgs; [
    xclip
  ];

}
