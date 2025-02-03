{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.desktop.cde;
in {
  options.afxq.desktop.cde = with types; {
    enable = mkBoolOpt false "Whether or not to enable sway.";
  };

  config = mkIf cfg.enable { services.xserver.desktopManager.cde = enabled; };
}
