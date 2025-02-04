{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.suites.desktop;
in {
  options.afxq.suites.desktop = with types; {
    enable =
      mkBoolOpt false "Whether or not to enable common desktop configuration.";
  };

  config = mkIf cfg.enable {
    afxq = {
      desktop = {
        plasma = enabled;
      };

      apps = {
        firefox = enabled;
        vlc = enabled;
        logseq = enabled;
        gparted = enabled;
      };
    };
  };
}
