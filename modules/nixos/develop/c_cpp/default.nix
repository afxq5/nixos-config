{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.develop.c_cpp;
in {
  options.afxq.develop.c_cpp = with types; {
    enable = mkBoolOpt false "Whether or not to enable c_cpp.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs;
      with pkgs.afxq; [
        gcc-arm-embedded
        gdb
        openocd
        gcc
        clang-tools
        clang
        libclang
        ccls
        libcrypt
      ];
  };
}
