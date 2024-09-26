{pkgs, ...}: let
  # theme = "gruvbox-dark-medium";
  theme = "da-one-sea";
  base16 = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";
  bg_image = ./images/da-one-sea.jpg;
in {
  stylix.enable = true;

  stylix.image = bg_image;
  stylix.polarity = "dark";

  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gigavolt.yaml";
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-light-medium.yaml";
  stylix.base16Scheme = base16;

  xdg.configFile."qtile/theme.yaml".source = base16;
  xdg.configFile."qtile/background.png".source = bg_image;
}
