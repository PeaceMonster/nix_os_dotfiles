{ config, lib, pkgs, ...}:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    plugins = [
      { name = "bobthefish"; src = pkgs.fishPlugins.bobthefish.src; }
    ];
  };
}
