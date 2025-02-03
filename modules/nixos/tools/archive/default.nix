{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.tools.archive;
in {
  options.afxq.tools.archive = with types; {
    enable = mkBoolOpt false "Whether or not to enable archive.";
  };

  config = mkIf cfg.enable {
    afxq.apps.xarchiver = enabled;
    environment.systemPackages = with pkgs;
      with pkgs.afxq; [
        unzip
        rar
        zstd
        p7zip
      ];
  };
}
