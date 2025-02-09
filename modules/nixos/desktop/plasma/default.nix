{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.desktop.plasma;
in {
  options.afxq.desktop.plasma = with types; {
    enable = mkBoolOpt false "Whether or not to enable plasma.";
  };

  config = mkIf cfg.enable {
    services.desktopManager.plasma6 = {
      enable = true;
      enableQt5Integration = true;
    };
  };
}
