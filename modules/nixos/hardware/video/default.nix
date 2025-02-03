{ options, config, pkgs, lib, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.hardware.video;
in {
  options.afxq.hardware.video = with types; {
    enable = mkBoolOpt false "Whether or not to enable networking support";
    hosts =
      mkOpt attrs { } (mdDoc "An attribute set to merge with `video.hosts`");
  };

  config = mkIf cfg.enable {
    hardware = {
      # smooth backlight control
      brillo.enable = true;

      graphics = {
        extraPackages32 = with pkgs.pkgsi686Linux; [
          vaapiVdpau
          libvdpau-va-gl
        ];
        extraPackages = with pkgs; [ vaapiVdpau libvdpau-va-gl ];
      };

      opentabletdriver.enable = true;

      xpadneo.enable = true;
    };
  };
}
