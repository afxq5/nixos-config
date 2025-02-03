{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.desktop.addons.wofi;
in {
  options.afxq.desktop.addons.wofi = with types; {
    enable =
      mkBoolOpt false "Whether to enable the Wofi in the desktop environment.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ wofi wofi-emoji ];

    # config -> .config/wofi/config
    # css -> .config/wofi/style.css
    # colors -> $XDG_CACHE_HOME/wal/colors
    # afxq.home.configFile."foot/foot.ini".source = ./foot.ini;
    afxq.home.configFile."wofi/config".source = ./config;
    afxq.home.configFile."wofi/style.css".source = ./style.css;
  };
}
