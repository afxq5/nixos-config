{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.whatsapp;
in {
  options.afxq.apps.whatsapp = with types; {
    enable = mkBoolOpt false "Whether or not to enable telegram.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ whatsapp-for-linux ];
  };
}
