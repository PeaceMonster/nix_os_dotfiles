{
  config,
  pkgs,
  pkgs-stable,
  ...
}:
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

  home.packages =
    with pkgs;
    [
      # Game Related
      prismlauncher

      # Editor
      libreoffice-qt6-fresh
      obsidian

      #Browser
      qutebrowser
      brave

      # Creation
      freecad
      gimp
      inkscape

      #Media
      mpv
      pympress
      pavucontrol
      playerctl
      spicetify-cli
      blueman
      zathura
      qbittorrent
      itch

      #Latex things

      #Utils
      bitwarden-desktop
      discord
      thunderbird
      aerc
      mu # emacs mail
      isync
      ledger
      ticktick
      bottles
    ]
    ++ (with pkgs-stable; [
      nerdfonts
    ]);
  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "emacs";
    VISUAL = "emacs";
    XKB_DEFAULT_OPTIONS = "caps:escape";
  };

  neovim = {
    enable = true;
    nixvim.enable = true;
  };
  emacs.enable = true;

  services.mpris-proxy.enable = true;

  spellcheck.enable = true;

  programs.zathura.enable = true;

  languages.java.enable = true;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ../user/terminal.nix
    ../user/spellcheck.nix
    ../user/languages/languages.nix
    ../user/defaults.nix
    ../user/neovim/neovim.nix
    ../user/emacs.nix
    ../user/theming.nix
    ../user/yazi/yazi.nix
    ../mail.nix
    # ./user/hyprland/default.nix
  ];
}
