{config, lib, pkgs, ...}:

{
  programs.git = {
      enable = true;
      
      userName = "Mikkel Ugilt";
      userEmail = "ugilt3@gmail.com";
  };
}
