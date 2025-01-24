{
  config,
  pkgs,
  pkgs-stable,
  ...
}: {
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
    # System

    # Game Related
    bottles
    prismlauncher
    ferium
    discord

    # Editor
    neovide
    emacs
    libreoffice-qt6-fresh

    #Browser
    qutebrowser
    brave

    # Creation
    freecad
    gimp
    inkscape
    prusa-slicer # 3D print
    godot_4 # Game Engine
    # Temp disable due to compile time - aseprite

    #Media
    mpv
    pympress
    pavucontrol
    playerctl
    shortwave
    spicetify-cli
    blueman
    zathura
    qbittorrent

    #Latex things
    texliveFull
    python312Packages.pygments

    #Utils
    bitwarden-desktop
    thunderbird
    ledger
  ] ++ (with pkgs-stable ; [
    nerdfonts
    rstudio
  ]);

  nixpkgs.config.allowUnfree = true;

  # home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    XKB_DEFAULT_OPTIONS = "caps:escape";
  };

  services.mpris-proxy.enable = true;

  programs.zathura.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    # ./user/neovim/neovim.nix
    ./user/terminal.nix
    ./user/languages.nix
    ./user/defaults.nix
    ./user/neovim/neovim.nix
    ./user/theming.nix
    ./user/yazi/yazi.nix
  ];
}
