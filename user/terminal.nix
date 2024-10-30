{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    # Terminals
    fish
    zsh

    starship

    # Programs
    libqalculate
    lazygit
    vim
    git
    rofi
    tldr
    bacon

    # File manipulation
    ffmpeg
    imagemagick
    pandoc
    texliveSmall
    graphviz
    tectonic
    unzip
    zip
    pdftk

    # Misc
    ripgrep # Seach tool like grep
    entr # Run command on file update
    skim # Fuzzy finder
    yt-dlp # Video downloader
    jq # Json cli tool
    just
    gnumake42
    cmake
    libtool
    file # Info about file
    asciidoctor
    fd # Better find
    yazi # Terminal File manager
    zoxide # z jump go brrr
    bat
    fzf
    wget
    xclip
    wl-clipboard
  ];

  home.shellAliases = {
    lg = "lazygit";
    nv = "nvim .";
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

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = pkgs.lib.importTOML ./starship.toml;
    enableTransience = true;
  };

  programs.zsh = {
    enable = true;
  };

  programs.bash = {
    enable = true;
  };

  imports = [
    ./fish.nix
  ];
}
