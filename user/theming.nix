{ pkgs, ... }:
let
  # theme = "gruvbox-dark-medium";
  # theme = "da-one-sea";
  theme = "gruvbox-light-medium";
  base16 = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";
  bg_image = ./images/gruvbox-light.png;
in
{
  stylix.enable = true;

  stylix.image = bg_image;
  stylix.polarity = "light";

  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gigavolt.yaml";
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-light-medium.yaml";
  stylix.base16Scheme = base16;

  stylix.autoEnable = false;

  stylix.targets = {
    # console.enable = true;
    fish.enable = true;
    nixvim.enable = true;
    gtk.enable = true;
  };

  xdg.configFile."qtile/theme.yaml".source = base16;
  xdg.configFile."qtile/background.png".source = bg_image;
  xdg.configFile."qutebrowser/theme.yaml".source = base16;
}
