{ pkgs, config, lib, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.fceux;
in {
  options.afxq.apps.fceux = with types; {
    enable = mkBoolOpt false "Whether or not to enable i3.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ fceux ]; };
}
