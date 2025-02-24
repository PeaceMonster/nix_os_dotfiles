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
    virtualbox

    # Game Related
    bottles
    prismlauncher
    ferium
    discord

    # Editor
    neovide
    libreoffice-qt6-fresh
    obsidian

    #Browser
    qutebrowser
    brave

    # Creation
    freecad
    gimp
    inkscape
    prusa-slicer # 3D print

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
    texliveFull
    python312Packages.pygments
    python312Packages.grip

    #Utils
    bitwarden-desktop
    thunderbird
    aerc
    mu # emacs mail
    isync
    ledger
    clockify # Time keeper for projects


  ] ++ (with pkgs-stable ; [
    nerdfonts
  ]);
  nixpkgs.config.allowUnfree = true;


  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "emacs";
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
    ./mail.nix
    # ./user/hyprland/default.nix
  ];
}
