{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.desktop.exwm;
in {
  options.afxq.desktop.exwm = with types; {
    enable = mkBoolOpt false "Whether or not to enable sway.";
  };

  config = mkIf cfg.enable {
    services.xserver.windowManager.exwm = {
      enable = true;
      enableDefaultConfig = true;
    };
  };
}
