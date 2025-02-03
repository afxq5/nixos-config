{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.tools.hardware;
in {
  options.afxq.tools.hardware = with types; {
    enable = mkBoolOpt false "Whether or not to enable hardware.";
  };

  config = mkIf cfg.enable {
    services.asusd = enabled;
    environment.systemPackages = with pkgs;
      with pkgs.afxq; [
        minicom
        openocd
        nixgl.nixGLIntel
        libGL
        libudev-zero
      ];
  };
}
