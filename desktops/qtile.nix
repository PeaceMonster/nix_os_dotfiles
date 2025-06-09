{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    desktops.qtile.enable = lib.mkEnableOption "Whether to enable or disable Qtile";
  };

  config = lib.mkIf config.desktops.qtile.enable {
    services.xserver.windowManager.qtile.enable = true;
    services.xserver.windowManager.qtile.extraPackages = python3Packages: with python3Packages; [pyyaml];
    nixpkgs.overlays = [
      (self: super: {
        qtile-unwrapped = super.qtile-unwrapped.overrideAttrs (_: rec {
          postInstall = let
            qtileSession = ''
              [Desktop Entry]
              Name=Qtile Wayland
              Comment=Qtile on Wayland
              Exec=qtile start -b wayland
              Type=Application
            '';
          in ''
            mkdir -p $out/share/wayland-sessions
            echo "${qtileSession}" > $out/share/wayland-sessions/qtile.desktop
          '';
          passthru.providedSessions = ["qtile"];
        });
      })
    ];

    # services.displayManager.sessionPackages = [pkgs.qtile-unwrapped];
  };
}
