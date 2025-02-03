{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.develop.c_cpp_libs;
in {
  options.afxq.develop.c_cpp_libs = with types; {
    enable = mkBoolOpt false "Whether or not to enable c_cpp libs.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs;
      with pkgs.afxq; [
        openssl
        pkg-config
	ncurses6
        ncurses
        gnutls
        libcrypt
        taglib
        libstdcxx5
        libclang
        libtool
      ];
  };
}
