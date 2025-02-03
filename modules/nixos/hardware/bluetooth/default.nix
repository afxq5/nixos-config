{ options, config, pkgs, lib, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.hardware.bluetooth;
in {
  options.afxq.hardware.bluetooth = with types; {
    enable = mkBoolOpt false "Whether or not to enable bluetooth support";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ bluez ];
    hardware.bluetooth = enabled;
  };
}
