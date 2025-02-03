{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.suites.art;
in {
  options.afxq.suites.art = with types; {
    enable = mkBoolOpt false "Whether or not to enable art configuration.";
  };

  config = mkIf cfg.enable {
    afxq = {
      apps = {
        gimp = enabled;
        inkscape = enabled;
        blender = enabled; 
      };
    };
  };
}
