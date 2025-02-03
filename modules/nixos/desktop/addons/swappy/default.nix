{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.desktop.addons.swappy;
in {
  options.afxq.desktop.addons.swappy = with types; {
    enable =
      mkBoolOpt false "Whether to enable Swappy in the desktop environment.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ swappy ];

    afxq.home.configFile."swappy/config".source = ./config;
    afxq.home.file."Pictures/screenshots/.keep".text = "";
  };
}
