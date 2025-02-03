{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let
  cfg = config.afxq.apps.firefox;
  defaultSettings = {
    "browser.startup.homepage" = "https://google.com";
    "browser.ssb.enabled" = true;
  };
in
{
  options.afxq.apps.firefox = with types; {
    enable = mkBoolOpt false "Whether or not to enable Firefox.";
    extraConfig =
      mkOpt str "" "Extra configuration for the user profile JS file.";
    userChrome =
      mkOpt str "" "Extra configuration for the user chrome CSS file.";
    settings = mkOpt attrs defaultSettings "Settings to apply to the profile.";
  };

  config = mkIf cfg.enable {
    # afxq.desktop.addons.firefox-nordic-theme = enabled;
    afxq.home = {
      extraOptions = {
        programs.firefox = {
          enable = true;

          profiles.${config.afxq.user.name} = {
            inherit (cfg) extraConfig userChrome settings;
            id = 0;
            name = config.afxq.user.name;
          };
        };
      };
    };
  };
}
