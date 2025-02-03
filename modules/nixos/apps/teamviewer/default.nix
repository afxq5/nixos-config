{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.teamviewer;
in {
  options.afxq.apps.teamviewer = with types; {
    enable = mkBoolOpt false "Whether or not to enable teamviewer.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; with pkgs.afxq; [ teamviewer ];
  };
}
