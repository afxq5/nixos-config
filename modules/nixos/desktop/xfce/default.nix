{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.desktop.xfce;
in {
  options.afxq.desktop.xfce = with types; {
    enable = mkBoolOpt false "Whether or not to enable xfce.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs.xfce;
      with pkgs.afxq;
      [
        xfce4-power-manager
        thunar
        thunar-volman
        thunar-archive-plugin
        thunar-media-tags-plugin
        tumbler
        ristretto

      ] ++ [ pkgs.lxde.lxsession ];
  };
}
