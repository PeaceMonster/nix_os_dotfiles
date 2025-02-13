{ config, lib, pkgs, ... }:

{
  accounts.email = {
    maildirBasePath = ".mail";
    accounts  = {
      uni = {
        primary = false;
        realName = "Mikkel Ugilt";
        userName = "au690053@uni.au.dk";
        address = "202106950@post.au.dk";
        passwordCommand = "cat  ~/.config/unimailpass";

        imap = {
          host = "post.au.dk";
          port = 993;
          tls.enable = true;
        };
        smtp = {
          host = "post.au.dk";
          port = 587;
          tls = {
            enable = true;
            useStartTls = true;
          };
        };
        mbsync = {
          enable = config.programs.mbsync.enable;
          create = "both";
        };
        notmuch.enable = config.programs.notmuch.enable;
        msmtp.enable = config.programs.msmtp.enable;
      };
      gmail = {
        primary = true;
        userName = "ugilt3";
        realName = "Mikkel Ugilt";
        address = "ugilt3@gmail.com";
        flavor = "gmail.com";
        passwordCommand = "cat  ~/.config/gmailpass";
        mbsync = {
          enable = config.programs.mbsync.enable;
          create = "both";
        };
        notmuch.enable = config.programs.notmuch.enable;
        msmtp.enable = config.programs.msmtp.enable;
      };
    };
  };
  programs = {
    msmtp.enable = true;
    notmuch.enable = true;
    mbsync.enable = true;
  };
}
