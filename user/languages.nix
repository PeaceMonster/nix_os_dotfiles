{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    python3
    typst
    cargo
  ];
}
