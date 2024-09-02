{pkgs, ...}: {
  stylix.enable = true;

  stylix.image = ./images/starStable.png;
  stylix.polarity = "dark";

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-soft.yaml";
}
