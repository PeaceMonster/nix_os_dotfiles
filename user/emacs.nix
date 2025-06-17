{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    emacs.enable = lib.mkEnableOption "Enable Emacs";
  };

  config = lib.mkIf config.emacs.enable {
    home.packages = with pkgs; [
      (
        (pkgs.emacsPackagesFor pkgs.emacs-pgtk).emacsWithPackages (
          epkgs:
            with epkgs; [
              mu4e
              (treesit-grammars.with-grammars (grammars:
                with grammars; [
                  tree-sitter-typst
                  tree-sitter-nix
                  tree
                ]))
            ]
        )
      )
      emacsPackages.treesit-grammars.with-all-grammars
    ];
  };
}
