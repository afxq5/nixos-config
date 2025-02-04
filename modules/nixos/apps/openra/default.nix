{ options, lib, config, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.openra;
in {
  options.afxq.apps.openra = with types; {
    enable = mkBoolOpt false "Whether or not to enable newvide.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ openra ]; };
}
