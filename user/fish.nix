{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting\n
      fish_vi_key_bindings
    '';
    plugins = [
    ];
  };
}
