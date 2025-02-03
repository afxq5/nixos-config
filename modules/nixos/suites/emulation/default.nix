{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.suites.emulation;
in {
  options.afxq.suites.emulation = with types; {
    enable =
      mkBoolOpt false "Whether or not to enable emulation configuration.";
  };

  config = mkIf cfg.enable {
    afxq = {
      apps = {
        qemu = enabled;
        pcsx2 = enabled;
        fceux = enabled;
        waydroid = enabled;
      };
    };
  };
}
