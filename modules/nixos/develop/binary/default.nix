{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.develop.binary;
in {
  options.afxq.develop.binary = with types; {
    enable = mkBoolOpt false "Whether or not to enable binary.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs;
      with pkgs.afxq; [
        binutils
        lldb
      ];
  };
}
