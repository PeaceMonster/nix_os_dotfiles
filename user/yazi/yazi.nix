{...}: {
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    keymap = {
      manager.prepend_keymap = [
        {
          on = ["g" "d"];
          run = "cd ~/Hentet";
          desc = "Go to downloads";
        }
        {
          on = ["g" "u" "<space>"];
          run = "cd ~/Dokumenter/Uni/";
          desc = "Go to Uni";
        }
        {
          on = ["g" "u" "d"];
          run = "cd ~/Dokumenter/Uni/Areas/DeepLearn/";
          desc = "Go to DeepLearn";
        }
        {
          on = ["g" "u" "a"];
          run = "cd ~/Dokumenter/Uni/Areas/ProgSys/";
          desc = "Go to ProgSys";
        }
        {
          on = ["g" "u" "g"];
          run = "cd ~/Dokumenter/Uni/Areas/CompGeo/";
          desc = "Go to CompGeo";
        }
        {
          on = ["g" "u" "h"];
          run = "cd ~/Dokumenter/Uni/Areas/HCI/";
          desc = "Go to HCI";
        }
        {
          on = ["g" "."];
          run = "cd ~/.dotfiles/";
          desc = "Go to dotfiles";
        }
      ];
    };
    plugins = {
      bookmarks = ./bookmarks.yazi/init.lua;
    };
  };
}
