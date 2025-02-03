{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.tools.bottom;
in {
  options.afxq.tools.bottom = with types; {
    enable = mkBoolOpt false "Whether or not to enable Bottom.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ bottom ]; };
}
