{ options, config, pkgs, lib, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.system.time;
in {
  options.afxq.system.time = with types; {
    enable =
      mkBoolOpt false "Whether or not to configure timezone information.";
  };

  config = mkIf cfg.enable { time.timeZone = "Africa/Cairo"; };
}
