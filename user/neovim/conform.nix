{
  lib,
  pkgs,
  ...
}: {
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save.lsp_format = "first";
      formatters_by_ft = {
        nix = ["alejandra"];
      };

      formatters = {
        alejandra = {
          command = lib.getExe pkgs.alejandra;
        };
      };
    };
  };
}
