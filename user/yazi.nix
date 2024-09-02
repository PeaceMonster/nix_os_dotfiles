{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };
  xdg.configFile."yazi/keymap.toml".source = ./keymap.toml;
}
