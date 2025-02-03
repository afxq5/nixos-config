{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.desktop.addons.electron-support;
in {
  options.afxq.desktop.addons.electron-support = with types; {
    enable = mkBoolOpt false
      "Whether to enable electron support in the desktop environment.";
  };

  config = mkIf cfg.enable {
    afxq.home.configFile."electron-flags.conf".source =
      ./electron-flags.conf;

    environment.sessionVariables = { NIXOS_OZONE_WL = "1"; };
  };
}
