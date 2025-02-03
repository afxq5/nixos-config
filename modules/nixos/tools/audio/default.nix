{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.tools.audio;
in {
  options.afxq.tools.audio = with types; {
    enable = mkBoolOpt false "Whether or not to enable audio.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; with pkgs.afxq; [ cava sptlrx ];
  };
}
