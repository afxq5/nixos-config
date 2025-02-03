{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.suites.desktop;
in {
  options.afxq.suites.desktop = with types; {
    enable =
      mkBoolOpt false "Whether or not to enable common desktop configuration.";
  };

  config = mkIf cfg.enable {
    afxq = {
      desktop = {
        # exwm = enabled;
        # hyprland = enabled;
        i3wm = enabled;
        sway = enabled;
        # enlightenment = enabled;
        # awesomewm = enabled;
        # cde = enabled;
        #addons = {
        #   wallpapers = enabled;
        #    rofi = enabled;
        # };
      };

      apps = {
        firefox = enabled;
        vlc = enabled;
        logseq = enabled;
        gparted = enabled;
      };
    };
  };
}
