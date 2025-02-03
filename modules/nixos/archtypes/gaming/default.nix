{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.archetypes.gaming;
in {
  options.afxq.archetypes.gaming = with types; {
    enable = mkBoolOpt false "Whether or not to enable the gaming archetype.";
  };

  config = mkIf cfg.enable {
    afxq = {
      apps = { fceux = enabled; playonlinux = enabled;};
      suites = {
        common = enabled;
        desktop = enabled;
        games = enabled;
        social = enabled;
        media = enabled;
      };
    };
  };
}
