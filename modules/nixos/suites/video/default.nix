{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.suites.video;
in {
  options.afxq.suites.video = with types; {
    enable = mkBoolOpt false "Whether or not to enable video configuration.";
  };

  config = mkIf cfg.enable {
    afxq = {
      apps = {
        pitivi = enabled;
        obs-studio = enabled;
      };
    };
  };
}
