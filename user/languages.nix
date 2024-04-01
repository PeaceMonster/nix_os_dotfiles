{ config, lib, pkgs, ... }:

{
  home.pakages = with pkgs; [
    python3
  ];
}
