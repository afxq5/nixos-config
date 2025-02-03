{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.desktop.addons.foot;
in {
  options.afxq.desktop.addons.foot = with types; {
    enable = mkBoolOpt false "Whether to enable the gnome file manager.";
  };

  config = mkIf cfg.enable {
    afxq.desktop.addons.term = {
      enable = true;
      pkg = pkgs.foot;
    };

    afxq.home.configFile."foot/foot.ini".source = ./foot.ini;
  };
}
