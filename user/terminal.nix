{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [

    #Emulator
    kitty

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
    rofi
    tldr
    bacon
    git
    rclone
    peaclock
    percollate # Tool for turning webpages into pdms

    # File manipulation
    ffmpeg
    imagemagick
    pandoc
    graphviz
    tectonic
    unzip
    zip
    pdftk

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
    rofi # Dmenu

    #Spelling
    hunspell
    hunspellDicts.da_DK
    hunspellDicts.en_US

    gnumake42
    cmake
    gdb
    libtool
    file # Info about file
    fd # Better find
    yazi # Terminal File manager
    zoxide # z jump go brrr
    tmsu
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
