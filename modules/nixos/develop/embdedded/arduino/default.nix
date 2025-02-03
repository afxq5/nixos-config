{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.develop.embdedded;
in {
  options.afxq.develop.embdedded = with types; {
    enable = mkBoolOpt false "Whether or not to enable embdedded";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs;
      with pkgs.afxq; [
        arduino
        avrdude
        pkgsCross.avr.buildPackages.gcc
      ];
  };
}
