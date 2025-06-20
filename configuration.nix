# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  pkgs-stable,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./desktops/desktops.nix
  ];

  desktops = {
    hyprland.enable = false;
    qtile.enable = true;
    plasma.enable = true;
    niri.enable = true;
  };

  # Bootloader.
  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
    };
  };
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "ugilt"; # Define your hostname.

  systemd.services.screenpadBrightness = {
    description = "Enables sudo-less brightness changes of screenpad";
    script = ''
      chmod a+w '/sys/class/leds/asus::screenpad/brightness'
      echo 255 > '/sys/class/leds/asus::screenpad/brightness'
    '';
    wantedBy = ["multi-user.target"];
  };

  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
  services.libinput.touchpad.disableWhileTyping = false;

  services.kanata = {
    enable = true;
    keyboards.internalKeyboard = {
      configFile = ./kanata.kbd;
    };
  };

  environment.sessionVariables = {
    NON_NIX = "$HOME/.dotfiles/non-nix/";
  };

  virtualisation.docker.enable = true;


  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Copenhagen";

  # Select internationalisation properties.
  i18n.defaultLocale = "da_DK.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "da_DK.UTF-8";
    LC_IDENTIFICATION = "da_DK.UTF-8";
    LC_MEASUREMENT = "da_DK.UTF-8";
    LC_MONETARY = "da_DK.UTF-8";
    LC_NAME = "da_DK.UTF-8";
    LC_NUMERIC = "da_DK.UTF-8";
    LC_PAPER = "da_DK.UTF-8";
    LC_TELEPHONE = "da_DK.UTF-8";
    LC_TIME = "da_DK.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.ly.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.xserver = {
    desktopManager.xfce.enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "dk";
    variant = "nodeadkeys";
    options = "caps:escape";
  };

  # Configure console keymap
  console.keyMap = "dk-latin1";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.syncthing = {
    enable = true;
    dataDir = "/home/ugilt/syncthing";
    openDefaultPorts = true;
    configDir = "/home/ugilt/.config/syncthing";
    user = "ugilt";
    group = "users";
    guiAddress = "127.0.0.1:8384";
  };


  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ugilt = {
    isNormalUser = true;
    description = "Mikkel Ugilt";
    extraGroups = ["networkmanager" "wheel" "gamemode" "docker" "adbusers" "input"];
  };

  # Install firefox.
  programs.firefox.enable = true;
  programs.gamemode.enable = true;
  programs.steam.enable = true;
  programs.adb.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    kanshi
    kanata
    wdisplays
    pamixer
    brightnessctl
    spotify
    kdePackages.kpmcore
    kdePackages.partitionmanager
    openssl
    wine64
    distrobox
  ];
  services.dbus.packages = [pkgs.libsForQt5.kpmcore];

  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  security.sudo = {
    enable = true;
    extraRules = [
      {
        commands = [
          {
            command = "/usr/bin/env";
            options = ["NOPASSWD"];
          }
        ];
        groups = ["wheel"];
      }
    ];
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      pkg-config
      openssl
    ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
