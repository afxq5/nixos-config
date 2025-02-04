{ config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.develop.embdedded.esp;
in {
  options.afxq.develop.embdedded.esp = with types; {
    enable = mkBoolOpt false "Whether or not to enable embdedded";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs;
      [
        espup
        cargo-espmonitor
        esptool
				llvmPackages_latest.llvm
				clang
				clang-tools
      ];
  };
}
