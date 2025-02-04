{ options, inputs, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.webtorrent;
in {
  options.afxq.apps.webtorrent = with types; {
    enable = mkBoolOpt false "Whether or not to enable i3.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ webtorrent_desktop ];
  };
}
