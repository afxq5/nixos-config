{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.apps.rpcs3;
in {
  options.afxq.apps.rpcs3 = with types; {
    enable = mkBoolOpt false "Whether or not to enable rpcs3.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ rpcs3 ]; };
}
