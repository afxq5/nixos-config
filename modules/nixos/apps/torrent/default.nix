{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.torrent;
in {
  options.afxq.apps.torrent = with types; {
    enable = mkBoolOpt false "Whether or not to enable torrent.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ transmission-gtk ];
  };
}
