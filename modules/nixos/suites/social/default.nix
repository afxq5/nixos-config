{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.suites.social;
in {
  options.afxq.suites.social = with types; {
    enable = mkBoolOpt false "Whether or not to enable social configuration.";
  };

  config = mkIf cfg.enable {
    afxq = {
      apps = {
        telegram = enabled;
        whatsapp = enabled;
      };
    };
  };
}
