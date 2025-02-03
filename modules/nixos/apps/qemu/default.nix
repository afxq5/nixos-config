{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.qemu;
in {
  options.afxq.apps.qemu = with types; {
    enable = mkBoolOpt false "Whether or not to enable qemu.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs;
      with pkgs.afxq; [
        qemu_full
        qemu-utils
      ];
  };
}
