{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.tartube;
in {
  options.afxq.apps.tartube = with types; {
    enable = mkBoolOpt false "Whether or not to enable tartube.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ tartube-yt-dlp yt-dlp ];
  };
}
