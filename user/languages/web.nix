{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    languages.web.enable = lib.mkEnableOption "Enable web tools, and web related languages";
  };

  config = lib.mkIf config.languages.web.enable {
    home.packages = with pkgs; [
      typescript
      nodejs_22
      emmet-language-server
      vscode-langservers-extracted
      typescript-language-server
    ];
  };
}
