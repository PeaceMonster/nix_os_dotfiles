{ config, pkgs, ... }:

{


  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ugilt";
  home.homeDirectory = "/home/ugilt";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    wget
    git
    qutebrowser
    nerdfonts
    gimp
    rofi
    wofi
    thunderbird
    mpv
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./user/neovim/neovim.nix
    ./user/terminal.nix
    ./user/languages.nix
  ];
}
