{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.desktop.i3wm;
in {
  options.afxq.desktop.i3wm = with types; {
    enable = mkBoolOpt false "Whether or not to enable I3wm .";
  };

  config = mkIf cfg.enable {
    services.xserver.windowManager.i3 = enabled;
    environment.systemPackages = with pkgs; [ i3lock i3blocks autotiling ];
    afxq = {
      desktop = {
        common-tiling = enabled;
        themes = enabled;
        xfce = enabled;
      };
      cli-apps = { dmenu = enabled; };
      apps = { ulauncher = enabled; };
      # system.fonts = enabled;
      home = {
        extraOptions = {
          home.packages = with pkgs; [
            kitty
            lm_sensors
            smartmontools
            foot
            # rofi
            imagemagick
            sassc
            # picom-pijulius
            picom
            wezterm
            material-icons
            # material-symbols
          ];
        };
      };
    };

  };
}
