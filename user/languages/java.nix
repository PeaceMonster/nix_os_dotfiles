{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    languages.java.enable = lib.mkEnableOption "Enable java lang and tools";
  };

  config = lib.mkIf config.languages.java.enable {
    home.packages = with pkgs; [
      zulu21
      jdt-language-server
      metals
    ];
  };
}
