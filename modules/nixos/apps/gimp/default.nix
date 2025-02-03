{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.gimp;
in {
  options.afxq.apps.gimp = with types; {
    enable = mkBoolOpt false "Whether or not to enable gimp.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; with pkgs.afxq; [ gimp ];
  };
}
