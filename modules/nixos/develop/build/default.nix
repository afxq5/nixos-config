{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.develop.build;
in {
  options.afxq.develop.build = with types; {
    enable = mkBoolOpt false "Whether or not to enable build.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs;
      with pkgs.afxq; [
        cmake
        gnumake
        ninja
        meson
        pkg-config
      ];
  };
}
