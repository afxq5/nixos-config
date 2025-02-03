{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.develop.assembly;
in {
  options.afxq.develop.assembly = with types; {
    enable = mkBoolOpt false "Whether or not to enable assembly.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      nasm
      imhex
      radare2
      pwndbg
      # ghidra
    ];
  };
}
