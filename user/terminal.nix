{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  home.packages = with pkgs; [
    #Emulator
    kitty

	# Spreadsheet cli
	visidata

    # Terminals
    fish
    zsh

    starship

    # Programs
    libqalculate
    lazygit
    vim
    git
    jujutsu
    rofi-wayland
    tlrc
    git
    htop
    rclone
    peaclock
    percollate # Tool for turning webpages into pdms
	bitwarden-cli

    # File manipulation
    ffmpeg
    imagemagick
    pandoc
    graphviz
    unzip
    zip
    pdftk
    bashmount

    # Misc
    direnv
    ripgrep # Seach tool like grep
    entr # Run command on file update
    skim # Fuzzy finder
    yt-dlp # Video downloader
    jq # Json cli tool
    just
    miniserve # Serve files
    comma # Temp programs

    poppler_utils

    gnumake42
    cmake
    gdb
    libtool
    file # Info about file
    fd # Better find
    yazi # Terminal File manager
	broot # Why only one fm
    zoxide # z jump go brrr
    tmsu # Tagging system
    bat
    fzf
    wget
    xclip
    wl-clipboard
    nh
  ];

  home.shellAliases = {
    lg = "lazygit";
    nv = "nvim .";
    ec = "emacsclient -t .";
    ya = "yy";
    zaf = "zathura --fork";
    act = "echo '/tmp/activefile' | entr";
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.git = {
    enable = true;
    userName = "Mikkel Ugilt";
    userEmail = "ugilt3@gmail.com";
  };

  programs.zsh = {
    enable = true;
  };

  programs.bash = {
    enable = true;
  };

  starship = {
    enable = true;
    fish.enable = true;
  };

  imports = [
    ./fish.nix
    ./starship/starship.nix
  ];
}
