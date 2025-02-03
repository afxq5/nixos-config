{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.brave;
in {
  options.afxq.apps.brave = with types; {
    enable = mkBoolOpt false "Whether or not to enable brave.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ brave ]; };
}
