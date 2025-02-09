{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.apps.themes;
in {
  options.afxq.apps.themes = with types; {
    enable = mkBoolOpt false "Whether or not to enable themes";
  };

  config = mkIf cfg.enable {
    gtk = { enable = true; };
    qt = { enable = true; };
  };
}
