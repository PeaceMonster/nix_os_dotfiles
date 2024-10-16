{
  config,
  pkgs,
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
    aseprite
    bitwarden-desktop
    blender
    blueman
    comma
    discord
    emacs
    ferium
    freecad
    gimp
    git
    godot_4
    inkscape
    kitty
    libreoffice-qt6-fresh
    miniserve
    mpv
    neovide
    nerdfonts
    pavucontrol
    playerctl
    prismlauncher
    pympress
    qutebrowser
    qbittorrent
    rofi
    spicetify-cli
    # spotify
    thunderbird
    zathura
  ];

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
