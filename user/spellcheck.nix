{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    spellcheck.enable = lib.mkEnableOption "Enables spellcheck";
  };

  config = lib.mkIf config.spellcheck.enable {
    home.packages = with pkgs; [
      #Spelling
      hunspell
      hunspellDicts.da_DK
      hunspellDicts.en_US
    ];
  };
}
