{ config, pkgs, lib, ... }:

{

  home.packages = with pkgs; [
    # Terminals
    fish
    zsh


    # Programs
    libqalculate
    lazygit
    vim
    git

    # File manipulation
    ffmpeg
    imagemagick
    pandoc
    graphviz
    tectonic
    unzip
    zip
    binutils
    pdftk

    # Misc
    ripgrep # Seach tool like grep
    entr # Run command on file update
    skim # Fuzzy finder
    yt-dlp # Video downloader
    jq # Json cli tool
    file # Info about file
    asciidoctor
    xclip
    fd # Better find
    yazi # Terminal File manager
    zoxide # z jump go brrr
    bat
  ];

  home.shellAliases = {
    lg = "lazygit";
  };


  programs.yazi = {
      enable = true;
      enableFishIntegration = true;
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

  imports = [
    ./fish.nix
    ./zsh.nix
  ];


}
