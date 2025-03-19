{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    languages.zig.enable = lib.mkEnableOption "Enable zig lang and tools";
  };

  config = lib.mkIf config.languages.zig.enable {
    home.packages = with pkgs; [
      zig
      zls
    ];
  };
}
