{ config, lib, pkgs, pkgs-stable, ... }:

{

  home.packages = [
    pkgs-stable.nerdfonts
  ];

}
