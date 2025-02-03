{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.mousai;
in {
  options.afxq.apps.mousai = with types; {
    enable = mkBoolOpt false "Whether or not to enable mousai.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; with pkgs.afxq; [ mousai ];
  };
}
