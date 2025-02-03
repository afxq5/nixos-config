{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.drawio;
in {
  options.afxq.apps.drawio = with types; {
    enable = mkBoolOpt false "Whether or not to enable drawio.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs.afxq; [ drawio ];
  };
}
