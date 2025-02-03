{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.desktop.wayland;
in {
  options.afxq.desktop.wayland = with types; {
    enable = mkBoolOpt false "Whether or not to enable wayland.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      wlsunset
      wayfire
      wl-clipboard
      wl-gammactl
      wl-clipboard
      wf-recorder
      watershot
      swww
      wlprop
    ];
    qt.platformTheme = "qt5ct";
    # QT
    hardware.graphics = {
      enable32Bit = true;
      enable = true;
    };
  };
}
