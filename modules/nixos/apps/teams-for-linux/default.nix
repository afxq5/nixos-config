{ options, inputs, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.teams-for-linux;
in {
  options.afxq.apps.teams-for-linux = with types; {
    enable = mkBoolOpt false "Whether or not to enable i3.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = [ teams-for-linux ]; };
}
