{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.desktop.awesomewm;
in {
  options.afxq.desktop.awesomewm = with types; {
    enable = mkBoolOpt false "Whether or not to enable Awesome Window Manager.";
  };

  config = mkIf cfg.enable {
    services.acpid = enabled;
    services.clipmenu = enabled;
    services.xserver = {
      enable = true;
      # displayManager = { defaultSession ="Hyprland"; };
      windowManager.awesome = {
        enable = true;
        package = pkgs.awesome-git;
        # luaModules = with pkgs.luaPackages; [
        # luarocks # is the package manager for Lua modules
        # luadbi-mysql # Database abstraction layer
        # ];
      };
    };
    afxq = {
      desktop = {
        common-tiling = enabled;
        themes = enabled;
        xfce = enabled;
      };
      cli-apps = { dmenu = enabled; };
      # system.fonts = enabled;
      home = {
        extraOptions = {
          home.packages = with pkgs; [
            lm_sensors
            smartmontools
            foot
            rofi
            imagemagick
            sassc
            # picom-pijulius
            picom
            wezterm
            material-icons
            material-symbols
          ];
        };
      };
    };

  };
}
