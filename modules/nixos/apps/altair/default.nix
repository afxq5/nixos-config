{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.altair;
in {
  options.afxq.apps.altair = with types; {
    enable = mkBoolOpt false "Whether or not to enable altair.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ altair ]; };
}
