{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.desktop.addons.waybar;
in {
  options.afxq.desktop.addons.waybar = with types; {
    enable =
      mkBoolOpt false "Whether to enable Waybar in the desktop environment.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ waybar ];

    afxq.home.configFile."waybar/config".source = ./config;
    afxq.home.configFile."waybar/style.css".source = ./style.css;
  };
}
