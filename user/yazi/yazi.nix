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
        {
          on = ["m"];
          run = "plugin bookmarks --args=save";
          desc = "Save current position as a bookmark";
        }
        {
          on = ["b" "j"];
          run = "plugin bookmarks --args=jump";
          desc = "Jump to a bookmark";
        }
        {
          on = ["b" "d"];
          run = "plugin bookmarks --args=delete";
          desc = "Delete a bookmark";
        }
        {
          on = ["b" "D"];
          run = "plugin bookmarks --args=delete_all";
          desc = "Delete all bookmarks";
        }
        {
          on = "O";
          run = "open $cwd";
          desc = "Open current directory";
        }
      ];
    };
    plugins = {
      bookmarks = ./bookmarks.yazi;
    };
  };
}
